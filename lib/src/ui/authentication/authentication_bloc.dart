/*
 * Jesseframework - Computer Expertz Ltd - https://cpxz.us
 * Copyright (C) 2019-2021 Jesseframework
 *
 * This file is part of Jesseframework - https://github.com/jesseframework/j3.
 *
 * Jesseframework is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version. 
 *
 * Jesseframework is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 */

import 'dart:async';
import 'dart:io' show Platform;
import 'package:bloc/bloc.dart';
import 'package:j3enterprise/main.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_schedule_crud.dart';
import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/resources/repositories/applogger_repositiry.dart';
import 'package:j3enterprise/src/resources/repositories/preference_repository.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';
import 'package:j3enterprise/src/resources/shared/function/check_for_user_data_on_server.dart';
import 'package:j3enterprise/src/resources/shared/function/schedule_background_jobs.dart';
import 'package:j3enterprise/src/resources/shared/utils/date_formating.dart';
import 'package:j3enterprise/src/resources/shared/utils/user_hashdigest.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  var db;
  final UserRepository userRepository = getIt<UserRepository>();
  late UserFromServer userFromServer;
  late UserHashSave userHash;
  late AppLoggerRepository appLoggerRepository;
  late PreferenceRepository preferenceRepository;
  late BackgroundJobScheduleDao backgroundJobScheduleDao;
  late BusinessRuleDao businessRuleDao;
  late Scheduler scheduleler;
  static final _log = Logger('LoginBloc');

  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    db = MyDatabase();
    userFromServer = new UserFromServer(userRepository: userRepository);
    userHash = new UserHashSave(userRepository: userRepository);
    appLoggerRepository = new AppLoggerRepository();
    preferenceRepository = new PreferenceRepository();
    backgroundJobScheduleDao = new BackgroundJobScheduleDao(db);
    businessRuleDao = new BusinessRuleDao(db);
    scheduleler = new Scheduler();


    
    on<PushNotification>((event, emit) => _mapPushNotificationToState(event, emit));
    on<AppStarted>((event, emit) => _mapAppStartedEventToState(event, emit));
    on<LoggedIn>((event, emit) => _mapLoggedInEventToState(event, emit));
    on<OfflineLoginButtonPressed>((event, emit) => _mapOfflineLoginButtonPressedEventToState(event, emit));
    on<LoggedOut>((event, emit) => _mapLoggedOutEventToState(event, emit));
  }

  _mapPushNotificationToState(PushNotification event, Emitter<AuthenticationState> emit) {
    emit(PushNotificationState(route: event.route));
  }

  _mapAppStartedEventToState(AppStarted event, Emitter<AuthenticationState> emit) async {
    await Future.delayed(Duration(seconds: 9));
    final bool hasToken = await userRepository.hasToken();
    if (hasToken) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  _mapLoggedInEventToState(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.persistToken(event.token, event.userId, event.tenantId);
    emit(AuthenticationAuthenticated());
    _log.finest('Starting background Jobs');

    if (Platform.isWindows && Platform.isMacOS) {
      var autoStartJobs = await businessRuleDao.getSingleBusinessRule("AUTOSTARTJOBS");
      if (autoStartJobs.value == "ON" && autoStartJobs.expiredDateTime!.isAfter(DateTime.now()) && autoStartJobs.isGlobalRule == false) {
        var jobData = await backgroundJobScheduleDao.getAllJobs();
        for (var eachJob in jobData) {
          scheduleler.scheduleJobs(eachJob.syncFrequency, eachJob.jobName, (Timer timer) => appLoggerRepository.putAppLogOnServer(eachJob.jobName));
          _log.finest('background Jobs start');
        }
      }
    }

    if (Platform.isIOS && Platform.isAndroid) {
      var autoStartJobs = await businessRuleDao.getSingleBusinessRule("AUTOSTARTJOBS");
      if (autoStartJobs.value == "ON" && autoStartJobs.expiredDateTime!.isAfter(DateTime.now()) && autoStartJobs.isGlobalRule == false) {
        var jobData = await backgroundJobScheduleDao.getAllJobs();
        for (var eachJob in jobData) {
          scheduleler.scheduleJobs(eachJob.syncFrequency, eachJob.jobName, (Timer timer) => appLoggerRepository.putAppLogOnServer(eachJob.jobName));
          _log.finest('background Jobs start');
        }
      }
    }

    var offlineReady = await userFromServer.validateUser(event.userId, event.tenantId);
    print(offlineReady);
    if (offlineReady == true) {
      emit(AuthenticationCreateMobileHash());
    }
  }

  _mapOfflineLoginButtonPressedEventToState(OfflineLoginButtonPressed event, Emitter<AuthenticationState> emit) async {
    await userHash.saveHash(event.password, event.tenantId, event.userId);
    emit(AuthenticationAuthenticated());
  }

  _mapLoggedOutEventToState(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.deleteToken();

    _log.finest('Canceling background Jobs');

    if (Platform.isWindows && Platform.isMacOS) {
      var autoAtartJobs = await businessRuleDao.getSingleBusinessRule("AUTOSTOPJOBS");
      if (autoAtartJobs.value == "ON" && autoAtartJobs.expiredDateTime!.isAfter(DateTime.now()) && autoAtartJobs.isGlobalRule == false) {
        var jobData = await backgroundJobScheduleDao.getAllJobs();
        appLoggerRepository.isStopped = true;
        preferenceRepository.isStopped = true;
        for (var eachJob in jobData) {
          scheduleler.cancel(eachJob.jobName);

          String formatted = await formatDate(DateTime.now().toString());
          var fromEvent = new BackgroundJobScheduleCompanion(
              enableJob: moor.Value(false), jobStatus: moor.Value("Cancel"), lastRun: moor.Value(DateTime.tryParse(formatted)!));

          await backgroundJobScheduleDao.updateBackgroundJob(fromEvent, eachJob.jobName);
        }
        _log.finest('background Jobs Canceled');
      }
    }

    if (Platform.isIOS && Platform.isAndroid) {
      var autoAtartJobs = await businessRuleDao.getSingleBusinessRule("AUTOSTARTJOBS");
      if (autoAtartJobs != null &&
          autoAtartJobs.value == "ON" &&
          autoAtartJobs.expiredDateTime!.isAfter(DateTime.now()) &&
          autoAtartJobs.isGlobalRule == false) {
        var jobData = await backgroundJobScheduleDao.getAllJobs();
        for (var eachJob in jobData) {
          scheduleler.cancel(eachJob.jobName);

          String formatted = await formatDate(DateTime.now().toString());
          var fromEvent = new BackgroundJobScheduleCompanion(
              enableJob: moor.Value(false), jobStatus: moor.Value("Cancel"), lastRun: moor.Value(DateTime.tryParse(formatted)!));

          await backgroundJobScheduleDao.updateBackgroundJob(fromEvent, eachJob.jobName);
        }
        _log.finest('background Jobs Canceled');
      }
    }

    emit(AuthenticationUnauthenticated());
  }
}
