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

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_it/get_it.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/check_out/bloc/sales_order_finalize_bloc.dart';
import 'package:j3enterprise/src/resources/services/background_fetch_service.dart';
import 'package:j3enterprise/src/resources/services/init_services.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/routes.dart';
import 'package:j3enterprise/src/resources/shared/utils/theme.dart';
import 'package:j3enterprise/src/ui/home/home.dart';
import 'package:j3enterprise/src/ui/login/login_page.dart';
import 'package:j3enterprise/src/ui/login_offline/offline_login_page.dart';
import 'package:j3enterprise/src/ui/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/resources/repositories/user_repository.dart';
import 'src/resources/shared/common/loading_indicator.dart';
import 'src/resources/shared/utils/langcustomdialogbox.dart';
import 'src/ui/authentication/authentication_bloc.dart';
import 'src/ui/authentication/authentication_event.dart';
import 'src/ui/authentication/authentication_state.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  getIt.registerLazySingleton(() => UserRepository());
}

Future<void> main() async {
  setupLocator();
//Important Information
//Don't change the order of InitServiceSetup
//Order of class
//1- InitalServerSetup
//2- setMokInitalValue
//3- setupLoggin

  WidgetsFlutterBinding.ensureInitialized();

  //InitServiceSetup initServiceSetup = new InitServiceSetup();

  if (Platform.isWindows || Platform.isMacOS) {
    SharedPreferences.setMockInitialValues({});
  }
  await systemInitelSetup();
  final userRepository = UserRepository();

  runApp(
    App(
      userRepository: userRepository,
    ),
  );
  if (Platform.isAndroid || Platform.isIOS) {
    BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  }
}

class App extends StatefulWidget {
  final UserRepository userRepository;
  //late ThemeData themeData;

  App({Key? key, required this.userRepository, ThemeData? themeData})
      : super(key: key);
  static void setLocale(BuildContext context, Locale locale) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state!.setLocale(locale);
  }

  static void setTheme(BuildContext context) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state!.didChangeDependencies();
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale= Locale(ENGLISH, 'US');
  ThemeData? themeData;

  void setLocale(locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getIt<UserRepository>().getLocale().then((value) {
      setState(() {
        _locale = value;
      });
    });
    getIt<UserRepository>().getTheme().then((value1) {
      setState(() {
        themeData = value1 == 'dark' ? darkTheme : lightTheme;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc()..add(AppStarted()),
        ),
        BlocProvider<SalesOrderFinalizeBloc>(
          create: (context) => SalesOrderFinalizeBloc(),
        ),
        BlocProvider<AddItemBloc>(
          create: (context) => AddItemBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // navigatorObservers: [BotToastNavigatorObserver()],
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationCreateMobileHash) {
              return OfflineLoginPage(userRepository: widget.userRepository);
            }
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage();
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
            return SplashPage();
          },
        ),
        theme: themeData,
        locale: _locale,
        onGenerateRoute: Routes().generateRoute,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('es', 'ES'),
          Locale('sk', 'SK'),
        ],
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          if (Platform.isAndroid) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
          } else if (Platform.isIOS) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
          }

          return supportedLocales.first;
        },
      ),
    );
  }
}
