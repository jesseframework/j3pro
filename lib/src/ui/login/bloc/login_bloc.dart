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
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/database/crud/tenant/tenant_crud.dart';
import 'package:j3enterprise/src/database/crud/user/user_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/add_item_to_transaction.dart';
import 'package:j3enterprise/src/resources/repositories/applogger_repositiry.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';
import 'package:j3enterprise/src/resources/services/connection_service.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:j3enterprise/src/resources/shared/utils/user_hashdigest.dart';
import 'package:j3enterprise/src/ui/authentication/authentication_bloc.dart';
import 'package:j3enterprise/src/ui/authentication/authentication_event.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart' as moor;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  late AppLoggerRepository appLoggerRepository;
  late UserSharedData userSharedData;
  late TenantDao tenantDao;
  late SalesOrderDetailTempDao salesOrderDetailTempDao;

  static final _log = Logger('LoginBloc');

  //AppLogger appLogger;
  late UserHash userHash;
  late String tenantName;

  var db;
  late UserDao userDao;

  LoginBloc({required this.userRepository, required this.authenticationBloc}) : super(LoginInitial(tenantName: '')) {
    userHash = new UserHash(userRepository: userRepository);
    db = MyDatabase();
    userSharedData = new UserSharedData();
    appLoggerRepository = new AppLoggerRepository();
    tenantDao = new TenantDao(db);
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);

    //appLogger = new AppLogger();

    getData();

    userDao = UserDao(db);
    _log.finest('LoginBloc constructer call');


    on<LoginButtonPressed>((event, emit) => _mapLoginButtonPressedToState(event, emit));
  }

  getData() async {
    tenantName = (await userRepository.getTenantFromSharedPref())??'';
  }


  LoginState get initialState => LoginInitial(tenantName: '');




    _mapLoginButtonPressedToState(LoginButtonPressed event, Emitter<LoginState> emit) async{
      _log.finest('Bloc mapEventToState call');
    try {
      String tenantId;
      String deviceState;
      String tenantState;

      
        if (Platform.isAndroid || Platform.isIOS) {
          var isConnected = await ConnectionService().isConnected();
          _log.finest('Connection check call');
          print(isConnected);
          if (isConnected) {
            _log.info(isConnected);

            emit( LoginLoading());
            _log.finest('Bloc state change to LoginLoading');
            final Response tenantResponse = await userRepository.checkTenant(tenancyName: event.tenantName);
            Map<String, dynamic> tenantMap = json.decode(tenantResponse.bodyString);
            if (tenantResponse.isSuccessful && tenantMap['success']) {
              _log.finest('Tenant response check in LoginLoading state');
              Map<String, dynamic> tenantResult = tenantMap['result'];
              _log.finest('Tenant result in LoginLoading state : ' + tenantResult.toString());

              tenantId = tenantResult['tenantId'].toString();
              deviceState = '';
              tenantState = '';

              userSharedData.setUserSharedPref(
                  event.deviceId, deviceState, tenantState, event.username, event.tenantName, tenantId.toString(), 0.toString());

              _log.finest('Tenant tenant result assign to virable tenant LoginLoading state');
              if (tenantResult['tenantId'] == null) {
                tenantId = 0.toString();
                String error = "There is no tenant defined with name";
                _log.info(error);

                if (error == null) {
                  _log.info('Transulate tenant error message and show message to user. LoginLoading state');
                  error = AppLocalization.of(event.context)!.translate('tenant_validation_message') ?? "There is no tenant defined with name";
                }
                emit( LoginFailure(error: error));
                _log.info('Bloc state change to LoginFailure when trying to get tenant');
                return;
              }
            } else {
              String error = tenantMap["error"]["details"].toString();
              _log.info(error, StackTrace.current);
              if (error == null) {
                error = AppLocalization.of(event.context)!.translate('online_login_failed') ?? "Something went wrong! Please try again";
              }
              emit( LoginFailure(error: error));
              return;
            }

            //Check user and validate password
            _log.finest('Start validate username and password');
            final Response response = await userRepository.authenticate(
              username: event.username,
              password: event.password,
            );
            Map<String, dynamic> map = json.decode(response.bodyString);
            if (response.isSuccessful && map['success']) {
              //decode the response body
              _log.finest('API response is successful');
              Map<String, dynamic> result = map['result'];
              _log.finest('Create share preference for user');
              int? userId = int.tryParse(result['userId'].toString());
              userSharedData.setUserSharedPref(
                  event.deviceId, deviceState, tenantState, event.username, event.tenantName, tenantId.toString(), userId.toString());

              _log.finest('Add user teanant in Tenant Db');
              var tenantData = new TenantCompanion(
                  tenantId: moor.Value(int.tryParse(tenantId)!),
                  tenantName: moor.Value(event.tenantName),
                  userId: moor.Value(userId),
                  userName: moor.Value(event.username));
              await tenantDao.createOrUpdate(tenantData);

              _log.finest('Moveing to authenticationBloc');
              authenticationBloc.add(LoggedIn(token: result['accessToken'], userId: result['userId'], tenantId: int.tryParse(tenantId)!));

              emit( LoginInitial(tenantName: ''));
            } else {
              //display errors
              String error = map["error"]["details"].toString();
              _log.info(error, StackTrace.current);
              if (error == null) {
                error = AppLocalization.of(event.context)!.translate('online_login_failed') ?? "Something went wrong! Please try again";
              }
              emit( LoginFailure(error: error));
            }
          } else {
            //Login offline with hash
            _log.finest('Trying to loging offline');
            emit( LoginLoading());
            var getTenantData = await tenantDao.getSingleTenant(event.tenantName, event.username);
            if (getTenantData != null) {
              var userDate = await userDao.getSingleTenantUser(event.username, getTenantData.tenantId);
              if (userDate != null) {
                _log.finest('Get tenant from user table');
                final int? _tenantId = userDate.tenantId;

                String _userHash = await userHash.createHash(event.password, _tenantId!, userDate.id);
                _log.finest('Create user mobile hash $_userHash');
                _log.finest('Validation mobile hash');
                if (userDate.mobileHash == _userHash.toString()) {
                  _log.finest('Moving  to authenticationBloc');
                  _log.finest('Create share preference for user');
                  userSharedData.setUserSharedPref(event.deviceId, "", "", event.username, tenantName, _tenantId.toString(), userDate.id.toString());
                  authenticationBloc.add(LoggedIn(token: "", userId: userDate.id, tenantId: int.tryParse(_tenantId.toString())!));
                  emit( LoginInitial(tenantName: ''));
                } else {
                  String error = AppLocalization.of(event.context)!.translate('online_login_code_miss_match') ?? 'Invalid User Name or Password';
                  _log.info(error, StackTrace.current);
                  emit( LoginFailure(error: error));
                }
              } else {
                String error = AppLocalization.of(event.context)!.translate('offline_login_failed') ??
                    'Something went wrong! Unable to log you in offline. Please try againg';
                _log.info(error, StackTrace.current);
                emit( LoginFailure(error: error));
              }
            } else {
              String error = AppLocalization.of(event.context)!.translate('offline_login_failed') ??
                  'Something went wrong! Unable to log you in offline. Please try againg';
              _log.info(error, StackTrace.current);
              emit( LoginFailure(error: error));
            }
          }
        } else {
          //Not Android and iOS device
          emit( LoginLoading());
          _log.finest('Loging on with non Android or iOS devices');
          final Response tenantResponse = await userRepository.checkTenant(tenancyName: event.tenantName);
          Map<String, dynamic> tenantMap = json.decode(tenantResponse.bodyString);
          _log.finest('Tenant response check in LoginLoading state');
          if (tenantResponse.isSuccessful && tenantMap['success']) {
            Map<String, dynamic> tenantResult = tenantMap['result'];
            _log.finest('Tenant result in LoginLoading state : ' + tenantResult.toString());
            print(tenantResult);
            await userRepository.setTenantIntoSharedPref(event.tenantName);

            deviceState = '';
            tenantState = '';

            tenantId = tenantResult['tenantId'].toString();
            userSharedData.setUserSharedPref(
                event.deviceId, deviceState, tenantState, event.username, event.tenantName, tenantId.toString(), 0.toString());
            _log.finest('Tenant tenant result assign to virable tenant LoginLoading state');

            if (tenantResult['tenantId'] == null) {
              tenantId = 0.toString();
              String error = "There is no tenant defined with name";
              if (error == null) {
                error = AppLocalization.of(event.context)!.translate('tenant_validation_message') ?? "There is no tenant defined with name";
              }
              emit( LoginFailure(error: error));
              _log.info('Bloc state change to LoginFailure');
              return;
            }
          } else {
            String error = tenantMap["error"]["details"].toString();
            _log.info(error);
            if (error == null) {
              error = AppLocalization.of(event.context)!.translate('online_login_failed') ?? "Something went wrong! Please try again";
            }
            emit( LoginFailure(error: error));
            return;
          }
          final Response response = await userRepository.authenticate(
            username: event.username,
            password: event.password,
          );
          Map<String, dynamic> map = json.decode(response.bodyString);
          if (response.isSuccessful && map['success']) {
            //decode the response body
            Map<String, dynamic> result = map['result'];
            _log.finest('Moveing to authenticationBloc');
            _log.finest('Create share preference for user');
            int? userId = int.tryParse(result['userId'].toString());
            userSharedData.setUserSharedPref(event.deviceId, "", "", event.username, tenantName, tenantId, userId.toString());
            authenticationBloc.add(LoggedIn(token: result['accessToken'], userId: result['userId'], tenantId: int.tryParse(tenantId)!));
            emit( LoginInitial(tenantName: ''));
          } else {
            //display errors
            // can have an error class and use from map here as well
            String error = map["error"]["details"].toString();
            if (error == null) {
              error = AppLocalization.of(event.context)!.translate('online_login_failed') ?? "Something went wrong! Please try again";
            }
            emit( LoginFailure(error: error));
          }
        }
    
    } catch (error) {
      _log.shout(error, StackTrace.current);
      emit( LoginFailure(error: error.toString()));
    }
  }

  
  

}
