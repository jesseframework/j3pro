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

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:j3enterprise/src/database/crud/user/user_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';
import 'package:j3enterprise/src/resources/shared/icons/custom_icons.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:j3enterprise/src/resources/shared/utils/langcustomdialogbox.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';

import '../../../main.dart';
import '../../../main.dart';
import '../../resources/repositories/user_repository.dart';
import '../../resources/shared/icons/custom_icons.dart';

class ProfilePage extends StatefulWidget {
  var db;
  late UserDao userDao;
  ProfilePage() {
    db = MyDatabase();
    userDao = UserDao(db);
  }

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String tenantName;
  late String theme;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  Future getProfileData() async {
    theme = await getIt<UserRepository>().getTheme().toString();
    if (theme == null) {
      theme = 'light';
    }
    final data = await UserSharedData().getUserSharedPref();
    tenantName = data['tenantName'];
    if (data['userId'] != null) {
      final profileData = await widget.userDao.getSingleUser(int.tryParse(data['userId'])!);
      return profileData;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        //ToDo add translation for preferences title
        title: Text(AppLocalization.of(context)!.translate('profile_title') ?? "Profile"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(
              Icons.wifi,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
      // backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
        future: getProfileData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? user = snapshot.data as User?;
            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      'images/beach-background.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16.0),
                              margin: EdgeInsets.only(top: 16.0),
                              decoration: BoxDecoration(color: Theme.of(context).cardColor.withOpacity(.8), borderRadius: BorderRadius.circular(5.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 96.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          title: Text(user!.userName),
                                          subtitle: Text(tenantName),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'images/beach-background.jpg',
                                      ),
                                      fit: BoxFit.cover)),
                              margin: EdgeInsets.only(left: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor.withOpacity(.8),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text("User information"),
                              ),
                              Divider(),
                              ListTile(
                                title: Text("Email"),
                                subtitle: Text(user.emailAddress),
                                leading: Icon(Icons.email),
                              ),
                              ListTile(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return LangCustomDialog();
                                      });
                                },
                                title: Text(
                                  AppLocalization.of(context)!.translate('language_appdraw') ?? 'Language',
                                ),
                                subtitle: Text(selecteditem == 'es'
                                    ? 'Spanish'
                                    : selecteditem == 'en'
                                        ? 'English'
                                        : 'English'),
                                leading: Icon(CustomIcons.language),
                              ),
                              ListTile(
                                  title: Text("Dark Theme"),
                                  subtitle: Text(theme),
                                  leading: Icon(Icons.brightness_4),
                                  trailing: Switch(
                                      value: theme == 'dark' ? true : false,
                                      onChanged: (theme) async {
                                        if (theme == true) {
                                          await getIt<UserRepository>().setTheme('dark');
                                          widget.userDao.updateSingleUser(user.copyWith(themeData: Value('dark')));
                                        } else {
                                          await getIt<UserRepository>().setTheme('light');
                                          widget.userDao.updateSingleUser(user.copyWith(themeData: Value('Light')));
                                        }
                                        App.setTheme(
                                          context,
                                        );
                                      })),
                              ListTile(
                                title: Text("Currency"),
                                leading: Icon(Icons.brightness_4),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
          // return BuildProgressIndicator();
        },
      ),
    );
  }
}
