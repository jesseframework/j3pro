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

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/main.dart';
import 'package:j3enterprise/src/database/crud/desktop/desktop_crud.dart';
import 'package:j3enterprise/src/database/crud/user/user_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
<<<<<<< HEAD
 
=======
>>>>>>> dev
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/custom_drawer.dart';
import 'package:j3enterprise/src/resources/shared/widgets/no_data_found.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  static final route = '/home';
  var db;
  DesktopDao desktopDao;
  UserDao userDao;
  HomePage() {
    db = AppDatabase();
    desktopDao = DesktopDao(db);
    userDao = UserDao(db);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  int code = 0xe8b8;
  String image = 'images/beach-background.jpg';
  int userId;
  @override
  void didChangeDependencies() async {
    await getIt<UserRepository>().getUserSharedPref().then((value) {
      setState(() {
        userId = int.parse(value['userId']);
      });
    });
    super.didChangeDependencies();
  }

  getImageName(String themeMode) {
    if (themeMode == 'dark') {
      return 'images/dark-theme-background.jpg';
    } else {
      return 'images/beach-background.jpg';
    }
  }

  User user;
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context).translate('app_title')),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Platform.isAndroid || Platform.isIOS
                    ? StreamBuilder<ConnectivityResult>(
                        stream: Connectivity().onConnectivityChanged,
                        builder: (context, data) {
                          if (data.data == ConnectivityResult.none) {
                            return Icon(
                              Icons.signal_wifi_off,
                              color: Colors.red,
                            );
                          } else {
                            return Icon(
                              Icons.wifi,
                              color: Colors.greenAccent,
                            );
                          }
                        })
                    : Icon(
                        Icons.wifi,
                        color: Colors.greenAccent,
                      ))
          ],
        ),
        drawer: CustomDrawer(),
        body: StreamBuilder(
            stream: widget.userDao.watchSingleUser(userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                user = snapshot.data;
              }
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    snapshot.hasData == true
                        ? getImageName(user.themeData)
                        : image,
                  ),
                  fit: BoxFit.cover,
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              child: Center(
                                child: ListFilter(
                                    placeholder: 'Search',
                                    filter: searchText,
                                    onFilterChanged: (search) {
                                      setState(() {
                                        searchText = search;
                                      });
                                    }),
                              ),
                            )
                          ],
                          //    color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      StreamBuilder(
                          stream: widget.desktopDao
                              .watchAllBusinessRule(searchText),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<DesktopData> prefData = snapshot.data;
                              List<String> groupsCollection = List<String>();
                              prefData.forEach((element) {
                                if (!groupsCollection
                                    .contains(element.iconGroup)) {
                                  groupsCollection.add(element.iconGroup);
                                }
                              });
                              if (prefData.isEmpty) {
                                return BuildOnNoData(
                                  message: "No Desktop Icons found",
                                );
                              }
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: groupsCollection.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text(
                                              groupsCollection[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .cardColor
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Wrap(
                                                 direction: Axis.horizontal,
                                                 alignment: WrapAlignment.start,
                                                children: [
                                                 ...prefData.map((e) {
                                                  if (e.iconGroup ==
                                                      groupsCollection[index]) {
                                                    return InkWell(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              e.navigationRoute);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 8),
                                                          child: Container(
                                                            width: 70,
                                                            child: Column(
                                                              children: [
                                                                Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  child:
                                                                      Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    color: Color(
                                                                        int.parse(
                                                                            e.iconColour)),
                                                                    child: Icon(
                                                                        IconData(
                                                                            int.parse(e
                                                                                .iconCode),
                                                                            fontFamily: e
                                                                                .iconFamily),
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    child: Text(
                                                                  e.iconName,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  softWrap:
                                                                      true,
                                                                ))
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                              ]),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ); //                       r
                            }

                            return BuildProgressIndicator();
                          })
                    ]),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     StreamBuilder(
                //         stream: widget.desktopDao.watchAllBusinessRule(),
                //         builder: (context, snapshot) {
                //           if (snapshot.hasData) {
                //             return Text(snapshot.data.toString());
                //           }
                //           return BuildProgressIndicator();
                //         })
                //   ],
                // ),
              );
            }),
      );
    } catch (e) {}
  }
}
