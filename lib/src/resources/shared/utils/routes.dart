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

import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/sales_order_add_item_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_item_detail_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/seles_order_item_page.dart';
import 'package:j3enterprise/src/pro/ui/service_activities/service_activities_page.dart';
import 'package:j3enterprise/src/ui/about/about.dart';
import 'package:j3enterprise/src/ui/background_jobs/backgroundjobs_pages.dart';
import 'package:j3enterprise/src/ui/bussiness_rule/bussiness_rule_page.dart';
import 'package:j3enterprise/src/ui/communication/setup_communication_page.dart';
import 'package:j3enterprise/src/ui/home/home_page.dart';
import 'package:j3enterprise/src/ui/login/login_page.dart';
import 'package:j3enterprise/src/ui/preferences/preferences.dart';
import 'package:j3enterprise/src/ui/splash/splash_page.dart';

final routes = {
  //OfflineLoginPage.route: (BuildContext context) => OfflineLoginPage(),
  SalesOrderItemDetailPage.route: (BuildContext context) =>SalesOrderItemDetailPage(),
  BackgroundJobsPage.route: (BuildContext context) => BackgroundJobsPage(),
  SalesOrderItemPage.route: (BuildContext context) => SalesOrderItemPage(),
  SalesOrderPage.route: (BuildContext context) => SalesOrderPage(),
  CommunicationPage.route: (BuildContext context) => CommunicationPage(),
  BussinessRulePage.route: (BuildContext context) => BussinessRulePage(),
  ServiceActivitiesPage.route: (BuildContext context) =>ServiceActivitiesPage(),
  PreferencesPage.route: (BuildContext context) => PreferencesPage(),
  SalesOrderPage.route: (BuildContext context) => SalesOrderPage(),
  SplashPage.route: (BuildContext context) => SplashPage(),
  LoginPage.route: (BuildContext context) => LoginPage(),
  HomePage.route: (BuildContext context) => HomePage(),
  About.route: (BuildContext context) => About(),
  SalesOrderAddItemPage.route: (BuildContext context) => SalesOrderAddItemPage(),
};
