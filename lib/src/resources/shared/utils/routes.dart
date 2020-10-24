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
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_item_detail_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_information_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/new_sales_order_detail_page.dart';
import 'package:j3enterprise/src/pro/ui/service_activities/journey_plan_page.dart';
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
  SalesOrderItemDetailPage.route: (BuildContext context) =>
      SalesOrderItemDetailPage(),
  BackgroundJobsPage.route: (BuildContext context) => BackgroundJobsPage(),
  NewSalesOrderdetail.route: (BuildContext context) => NewSalesOrderdetail(),
  SalesOrderInformationPage.route: (BuildContext context) => SalesOrderInformationPage(),
  CommunicationPage.route: (BuildContext context) => CommunicationPage(),
  BussinessRulePage.route: (BuildContext context) => BussinessRulePage(),
  JourneyPlanPage.route: (BuildContext context) =>
      JourneyPlanPage(),
  PreferencesPage.route: (BuildContext context) => PreferencesPage(),
  SalesOrderInformationPage.route: (BuildContext context) => SalesOrderInformationPage(),
  SplashPage.route: (BuildContext context) => SplashPage(),
  LoginPage.route: (BuildContext context) => LoginPage(),
  HomePage.route: (BuildContext context) => HomePage(),
  About.route: (BuildContext context) => About(),
};
