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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/check_out/bloc/sales_order_finalize_bloc.dart';
import 'package:j3enterprise/src/resources/services/init_services.dart';
import 'package:j3enterprise/src/resources/shared/utils/routes.dart';
import 'package:j3enterprise/src/resources/shared/utils/theme.dart';
import 'package:j3enterprise/src/ui/home/home.dart';
import 'package:j3enterprise/src/ui/login/login_page.dart';
import 'package:j3enterprise/src/ui/login_offline/offline_login_page.dart';

import 'src/resources/repositories/user_repository.dart';
import 'src/resources/shared/common/loading_indicator.dart';
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
  await EasyLocalization.ensureInitialized();

  //InitServiceSetup initServiceSetup = new InitServiceSetup();

  if (!kIsWeb) {
    await systemInitelSetup();
  }

  final userRepository = UserRepository();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('sk', 'SK'),
      ],
      path: 'lang',
      fallbackLocale: Locale('en', 'US'),
      child: App(
        userRepository: userRepository,
      )));
}

class App extends StatefulWidget {
  final UserRepository userRepository;
  //late ThemeData themeData;

  const App({Key? key, required this.userRepository, ThemeData? themeData})
      : super(key: key);
  static void setLocale(BuildContext context, Locale locale) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state?.setLocale(locale);
  }

  static void setTheme(BuildContext context) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state?.didChangeDependencies();
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeData? themeData;

  void setLocale(locale) {
    setState(() {
      context.setLocale(locale);
    });
  }

  @override
  void didChangeDependencies() {
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
              return const LoginPage();
            }
            if (state is AuthenticationLoading) {
              return const LoadingIndicator();
            }
            return const LoginPage();
          },
        ),
        theme: themeData,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: Routes().generateRoute,
      ),
    );
  }
}
