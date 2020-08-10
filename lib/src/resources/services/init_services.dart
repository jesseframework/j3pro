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

import 'dart:io' show Platform;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/crud/communication/communication_setup_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/non_preference_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/preference_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/resources/api_clients/api_client.dart';
import 'package:j3enterprise/src/resources/services/bloc_deligate.dart';
import 'package:j3enterprise/src/resources/services/firebase_notification_service.dart';
import 'package:j3enterprise/src/resources/shared/function/application_logger.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';

class InitServiceSetup {
  var db;
  PreferenceDao preferenceDao;
  NonGlobalPreferenceDao nonGlobalPreferenceDao;
  UserSharedData userSharedData;
  AppLogger appLogger;
  Map<String, String> mapDevicePref = Map();
  InitServiceSetup() {
    db = AppDatabase();
    appLogger = new AppLogger();
    preferenceDao = new PreferenceDao(db);
    nonGlobalPreferenceDao = new NonGlobalPreferenceDao(db);
    userSharedData = new UserSharedData();
  }
  Future<void> setupLogging() async {
    mapDevicePref = await userSharedData.getUserSharedPref();
    String userName = mapDevicePref['userName'];
    String deviceID = mapDevicePref['deviceID'];
    String screen = mapDevicePref['screen'];

    //Turn on/off logs. Default value yes isGlobal no
    var saveLogToDd = await preferenceDao.getSinglePreferences('LOGGERON');
    if (saveLogToDd != null) {
      if (saveLogToDd.value == "ON" &&
          saveLogToDd.isGlobal == false &&
          (saveLogToDd.expiredDateTime.isAfter(DateTime.now()) ||
              saveLogToDd.expiredDateTime == null)) {
        var nonGlobalDb = await nonGlobalPreferenceDao.getSingleNonGlobalPref(
            'LOGGERON', 'LOGGERON', userName, deviceID, screen);
        if (nonGlobalDb != null &&
            nonGlobalDb.value == "ON" &&
            nonGlobalDb.isApply == true) {
          //Set not global
          if (nonGlobalDb.expiredDateTime.isAfter(DateTime.now()) ||
              nonGlobalDb.expiredDateTime == null) {
            var setLogLevel =
                await nonGlobalPreferenceDao.getSingleNonGlobalPref(
                    'LOGGERLEVEL', 'LOGGERLEVEL', userName, deviceID, screen);
            if (setLogLevel != null) {
              await logLevelCheck(setLogLevel.value);
            }
          }
        }
      } else {
        var setLogLevel =
            await preferenceDao.getSinglePreferences('LOGGERLEVEL');
        if (setLogLevel != null) {
          await logLevelCheck(setLogLevel.value);
        }
      }
    } else {
      //Set Default
      Logger.root.level = Level.FINEST;
    }

    Logger.root.onRecord.listen((rec) async {
      print(
          '${rec.loggerName} : ${rec.level.name}: ${rec.time.toIso8601String()} : ${rec.message} ');

      String _functionName = rec.loggerName.toString();
      var logHttp =
          await preferenceDao.getSinglePreferences('HTTPLOGINGTOSERVER');
      if (logHttp != null) {
        if (logHttp.value == "ON" &&
            logHttp.isGlobal == false &&
            logHttp.expiredDateTime.isBefore(DateTime.now())) {
          var nonGlobalDb = await nonGlobalPreferenceDao.getSingleNonGlobalPref(
              'HTTPLOGINGTOSERVER',
              'HTTPLOGINGTOSERVER',
              userName,
              deviceID,
              screen);
          if (nonGlobalDb != null &&
              nonGlobalDb.value == "ON" &&
              nonGlobalDb.isApply == true) {
            if (_functionName == "Chopper") {
              await appLogger.saveAppLog(rec.loggerName, rec.time, "NA",
                  rec.message, "NA", "NA", "NA", rec.level.name, 0, "NA", 0);
            } else {
              await appLogger.saveAppLog(rec.loggerName, rec.time, "NA",
                  rec.message, "NA", "NA", "NA", rec.level.name, 0, "NA", 0);
            }
          } else {
            if (_functionName != "Chopper") {
              await appLogger.saveAppLog(rec.loggerName, rec.time, "NA",
                  rec.message, "NA", "NA", "NA", rec.level.name, 0, "NA", 0);
            }
          }
        } else if (logHttp.value == "ON" &&
            logHttp.isGlobal == true &&
            logHttp.expiredDateTime.isBefore(DateTime.now())) {
          if (_functionName == "Chopper") {
            await appLogger.saveAppLog(rec.loggerName, rec.time, "NA",
                rec.message, "NA", "NA", "NA", rec.level.name, 0, "NA", 0);
          }
        } else {
          if (_functionName != "Chopper") {
            await appLogger.saveAppLog(rec.loggerName, rec.time, "NA",
                rec.message, "NA", "NA", "NA", rec.level.name, 0, "NA", 0);
          }
        }
      } else {
        if (_functionName != "Chopper") {
          await appLogger.saveAppLog(rec.loggerName, rec.time, "NA",
              rec.message, "NA", "NA", "NA", rec.level.name, 0, "NA", 0);
        }
      }
    });
  }

  Future<void> logLevelCheck(String logLevel) async {
    if (logLevel == 'SEVERE') {
      Logger.root.level = Level.SEVERE;
    }
    if (logLevel == 'INFO') {
      Logger.root.level = Level.INFO;
    }

    if (logLevel == 'WARNING') {
      Logger.root.level = Level.WARNING;
    }

    if (logLevel == 'SHOUT') {
      Logger.root.level = Level.SHOUT;
    }
    if (logLevel == 'FINE') {
      Logger.root.level = Level.FINE;
    }
    if (logLevel == 'FINEST') {
      Logger.root.level = Level.FINEST;
    }

    if (logLevel == 'OFF') {
      Logger.root.level = Level.OFF;
    }
    if (logLevel == 'ALL') {
      Logger.root.level = Level.ALL;
    }
  }
}

Future<void> systemInitelSetup() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  var dao = CommunicationDao(AppDatabase());
  var communicationData = await dao.getCommunicationDataByType("API");
  var serverUrl = communicationData == null || communicationData.isEmpty
      ? ApiClient.URL
      : communicationData[0].serverUrl;
  ApiClient.updateClient(serverUrl);
  if (!Platform.isWindows && !Platform.isMacOS) {
    FirebaseNotificationService.instance;
  }
  final int = InitServiceSetup();
  int.setupLogging();
}
