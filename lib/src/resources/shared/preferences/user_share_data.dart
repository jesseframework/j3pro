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

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedData {
  Future<void> setUserSharedPref(
      String? deviceId,
      String? deviceState,
      String? tenantState,
      String? userName,
      String? tenantName,
      String? tenantId,
      String? userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('deviceId', deviceId!);
    await prefs.setString('deviceState', deviceState!);
    await prefs.setString('tenantState', deviceState);
    await prefs.setString('userName', userName!);
    await prefs.setString('tenantName', tenantName!);
    await prefs.setString('tenantId', tenantId!);
    await prefs.setString('userId', userId!);

    return;
  }

  Future<Map> getUserSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? deviceId = (prefs.get('deviceId')) as String?;
    String? deviceState = (prefs.get('deviceState')) as String?;
    String? tenantState = (prefs.get('tenantState')) as String?;
    String? userName = (prefs.get('userName')) as String?;
    String? tenantName = (prefs.get('tenantName')) as String?;
    String? tenantId = (prefs.get('tenantId')) as String?;
    String? userId = (prefs.get('userId')) as String?;

    Map<String, String> map = {
      "deviceId": "$deviceId",
      "deviceState": "$deviceState",
      "tenantState": "$tenantState",
      "userName": "$userName",
      "tenantName": "$tenantName",
      "tenantId": "$tenantId",
      "userId": "$userId",
    };
    return map;
  }
}
