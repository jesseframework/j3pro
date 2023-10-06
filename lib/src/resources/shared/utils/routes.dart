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
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/ui/activities_menu/activities_menu_page.dart';

import 'package:j3enterprise/src/pro/ui/customer/customer_list_page.dart';
import 'package:j3enterprise/src/pro/ui/items/items_page.dart';
import 'package:j3enterprise/src/pro/ui/journey_plan/journey_plan_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/sales_order_add_item_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/sales_order_item_detail_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_information/sales_order_form.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_information/sales_order_page.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';

import 'package:j3enterprise/src/ui/about/about.dart';
import 'package:j3enterprise/src/ui/background_jobs/backgroundjobs_pages.dart';
import 'package:j3enterprise/src/ui/bussiness_rule/bussiness_rule_page.dart';
import 'package:j3enterprise/src/ui/communication/setup_communication_page.dart';
import 'package:j3enterprise/src/ui/home/home_page.dart';
import 'package:j3enterprise/src/ui/login/login_page.dart';
import 'package:j3enterprise/src/ui/login_offline/offline_login_page.dart';
import 'package:j3enterprise/src/ui/preferences/preferences.dart';
import 'package:j3enterprise/src/ui/splash/splash_page.dart';

class Routes {
  static const String splasScreen = '/splash';
  static const String itemScreen = '/itempage';
  static const String customerScreen = '/customerpage';
  static const String journeyPlanScreen = '/journey_plan_page';
  static const String activitiesMenuScreen = '/activitiesmenupage';
  static const String salesOrderScreen = '/SalesOrderPage';
  static const String salesOrderAddItemScreen = '/SalesOrderAddItemPage';
  static const String salesOrderItemDetailScreen = '/SalesOrderItemDetailPage';
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String aboutScreen = '/about';
  static const String preferencesScreen = '/preferences';
  static const String bussinessRuleScreen = '/businessrule';
  static const String communicationScreen = '/communication';
  static const String backgroundJobsScreen = '/BackgroundJobs';
  static const String acitvitesMenu = '/activities_menu';
  static const String offlineLogin = '/offline_login';

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splasScreen:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case itemScreen:
        return MaterialPageRoute(builder: (_) => ItemsPage());
      case customerScreen:
        return MaterialPageRoute(builder: (_) => CustomerListPage());
      case journeyPlanScreen:
        return MaterialPageRoute(
            builder: (_) => JourneyPlanPage(
                  
                ));
      case activitiesMenuScreen:
        return MaterialPageRoute(
            builder: (_) => ActivitiesMenuPage(
                  journeyWithAddress: routeSettings.arguments as JourneyWithAddress,
                ));
      case salesOrderScreen:
        return MaterialPageRoute(builder: (_) => SalesOrderPage());
      case salesOrderAddItemScreen:
        return MaterialPageRoute(builder: (_) => SalesOrderAddItemPage());
      case salesOrderItemDetailScreen:
        return MaterialPageRoute(
            builder: (_) => SalesOrderItemDetailPage(
                  index: routeSettings.arguments as int,
                ));
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case aboutScreen:
        return MaterialPageRoute(builder: (_) => About());
      case preferencesScreen:
        return MaterialPageRoute(builder: (_) => PreferencesPage());
      case bussinessRuleScreen:
        return MaterialPageRoute(builder: (_) => BussinessRulePage());
      case communicationScreen:
        return MaterialPageRoute(builder: (_) => CommunicationPage());
      case backgroundJobsScreen:
        return MaterialPageRoute(builder: (_) => BackgroundJobsPage());
      case acitvitesMenu:
        return MaterialPageRoute(
            builder: (_) => ActivitiesMenuPage(
                  journeyWithAddress: routeSettings.arguments as JourneyWithAddress,
                ));
      case offlineLogin:
        return MaterialPageRoute(
            builder: (_) => OfflineLoginPage(
                  userRepository: routeSettings.arguments as UserRepository,
                ));

      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
