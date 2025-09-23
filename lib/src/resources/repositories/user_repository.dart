import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:j3enterprise/src/resources/api_clients/api_client.dart';
import 'package:j3enterprise/src/resources/services/rest_api_service.dart';
import 'package:j3enterprise/src/resources/shared/utils/langcustomdialogbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  var api = ApiClient.chopper.getService<RestApiService>();
  Future<Response> authenticate({
    required String username,
    required String password,
  }) async {
    return await api.login({
      "rememberClient": true,
      "userNameOrEmailAddress": username,
      "password": password
    });
  }

  Future<Response> getUser({required int userID}) async {
    return await api.getUser(userID);
  }

  Future<Response> putUserHash({
    required int userId,
    required String mobileHashCode,
    required int tenantId,
  }) async {
    return await api.updateUserHash({
      "userID": userId,
      "mobileHashCode": mobileHashCode,
      "tenantId": tenantId
    });
  }

  Future<Response> checkTenant({required String tenancyName}) async {
    return await api.isTenantAvailable(body: {"tenancyName": tenancyName});
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('userId');
    await prefs.remove('tenantid');
    return;
  }

  Future<void> persistToken(String token, int userId, int tenantId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("access_token", token);
    await prefs.setString("userId", userId.toString());
    await prefs.setString("tenantid", tenantId.toString());
    return;
  }

  Future<void> setUserSharedPref(
      String deviceId,
      String deviceState,
      String tenantState,
      String userName,
      String tenantName,
      int tenantId,
      int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('deviceId', deviceId);
    await prefs.setString('deviceState', deviceState);
    await prefs.setString('tenantState', deviceState);
    await prefs.setString('userName', userName);
    await prefs.setString('tenantName', tenantName);
    await prefs.setInt('tenantId', tenantId);
    await prefs.setInt('userId', userId);
    return;
  }

  Future<Map> getUserSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? deviceId = prefs.getString('deviceId');
    String? deviceState = prefs.getString('deviceState');
    String? tenantState = prefs.getString('tenantState');
    String? userName = prefs.getString('userName');
    String? tenantName = prefs.getString('tenantName');
    String? tenantId = prefs.getString('tenantId');
    String? userId = prefs.getString('userId');

    Map<String, String> map = {
      "deviceId": "$deviceId",
      "userId": "$userId",
      "deviceState": "$deviceState",
      "tenantState": "$tenantState",
      "userName": "$userName",
      "tenantName": "$tenantName",
      "tenantId": "$tenantId",
    };
    return map;
  }

  Future<String?> getTenantFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString('tenatName');
    return result;
  }

  Future<void> setTenantIntoSharedPref(String tenantName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tenatName', tenantName);
    return;
  }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('access_token');
  }

  Future<Map<String, String>> getPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("access_token") ?? "";
    String userId = prefs.getString("userId") ?? "";
    String tenantId = prefs.getString("tenantid") ?? "";

    Map<String, String> map = {
      "token": token,
      "userId": userId,
      "tenantid": tenantId,
    };

    return map;
  }

//        ********** GET LOCALE FROM SHARED_PREFERENCE **********

  Future<Locale> setLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_LANGUAGE_CODE_KEY, languageCode);
    return _locale(languageCode);
  }

  Locale _locale(String languageCode) {
    Locale tempLocale;
    switch (languageCode) {
      case ENGLISH:
        tempLocale = const Locale(ENGLISH, 'US');
        break;
      case SPANISH:
        tempLocale = const Locale(SPANISH, 'ES');
        break;
      case HINDI:
        tempLocale = const Locale(HINDI, 'SK');
        break;
      default:
        tempLocale = const Locale(ENGLISH, 'US');
        break;
    }

    return tempLocale;
  }

  Future<Locale> getLocale() async {
    String finalLocale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLocale = prefs.getString(USER_LANGUAGE_CODE_KEY);
    String? deviceLocale = prefs.getString(DEVICE_LANGUAGE_CODE_KEY);
    String? defalutDeviceLocale = await getDeviceLocale();
    if (userLocale != null) {
      finalLocale = userLocale;
    } else {
      finalLocale = defalutDeviceLocale ?? 'en';
    }
    if (defalutDeviceLocale != deviceLocale) {
      await prefs.setString(DEVICE_LANGUAGE_CODE_KEY, defalutDeviceLocale!);
    }
    return _locale(finalLocale);
  }

  Future<String?> getDeviceLocale() async {
    String? currentLocale;
    try {
      currentLocale = await Devicelocale.currentLocale;
      return currentLocale?.substring(0, 2);
    } on PlatformException {
      print("Error obtaining current locale");
      return null;
    }
  }

  Future setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  Future<String?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('theme');
    return theme;
  }
}
