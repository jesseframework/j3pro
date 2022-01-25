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

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:j3enterprise/src/database/crud/prefrence/non_preference_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/preference_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
//import 'package:xlive_switch/xlive_switch.dart';

class PreferenceDetailPage extends StatefulWidget {
  final code;
  late NonGlobalPreferenceDao nonGlobalPreferenceDao;
  late PreferenceDao preferenceDao;
  PreferenceDetailPage(this.code) {
    db = AppDatabase();
    nonGlobalPreferenceDao = NonGlobalPreferenceDao(db);
    preferenceDao = PreferenceDao(db);
  }
  var db;

  @override
  _PreferenceDetailPageState createState() => _PreferenceDetailPageState();
}

class _PreferenceDetailPageState extends State<PreferenceDetailPage> {
  TextEditingController _textFieldController = TextEditingController();
  late String selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //ToDo add translation for preferences title
        title: Text(
            AppLocalization.of(context)!.translate('preferences_title') ??
                "Preferences"),
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
      body: Container(
          child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  "Edit Preference",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              StreamBuilder(
                  stream:
                      widget.preferenceDao.watchSinglePreferences(widget.code),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      PreferenceData? prefData;
                      prefData = snapshot.data as PreferenceData?;

                      //  print(prefData[1]);
                      return Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          elevation: 4.0,
                          //  height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text(
                                        prefData!.preferenceName!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Is Global',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      child: FlutterSwitch(
                                          value: prefData.isGlobal == false
                                              ? false
                                              : true,
                                          onToggle: (value) async {
                                            await widget.preferenceDao
                                                .updatePreferenceValue(
                                                    prefData!.copyWith(
                                              isGlobal: value,
                                            ));
                                          }),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Option',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                        child: prefData.dataType == 'Bool'
                                            ? FlutterSwitch(
                                                value: prefData.value == 'OFF'
                                                    ? false
                                                    : true,
                                                onToggle: (value) async {
                                                  await widget.preferenceDao
                                                      .updatePreferenceValue(
                                                          prefData!.copyWith(
                                                    value: value == true
                                                        ? 'ON'
                                                        : 'OFF',
                                                  ));
                                                })
//
                                            : prefData.dataType == 'Text'
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        prefData.value,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 16),
                                                      ),
                                                      InkWell(
                                                        child: Container(
                                                            color: Theme.of(
                                                                    context)
                                                                .cardColor,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                            child: Icon(
                                                                Icons.edit)),
                                                        onTap: () {
                                                          _textFieldController =
                                                              TextEditingController(
                                                                  text: prefData!
                                                                      .value);
                                                          _displayDialog(
                                                              context,
                                                              () => widget
                                                                  .preferenceDao
                                                                  .updatePreferenceValue(prefData!
                                                                      .copyWith(
                                                                          value:
                                                                              _textFieldController.text)));
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : DropdownSearch(
                                                    //backgroundColor: Theme.of(context).cardColor,
                                                    onFind: (value) async {
                                                      print(value);
                                                      return prefData!
                                                          .dataValue!
                                                          .split(',')
                                                          .map((e) => e)
                                                          .toList();
                                                    },
                                                    selectedItem:
                                                        prefData.value,
                                                    showSearchBox: true,
                                                    items: prefData.dataValue!
                                                        .split(',')
                                                        .map((e) => e)
                                                        .toList(),
                                                    onChanged: (value) async {
                                                      await widget.preferenceDao
                                                          .updatePreferenceValue(
                                                              prefData!.copyWith(
                                                                  value: value
                                                                      .toString()));
                                                    })),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Expiry Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      "${prefData.expiredDateTime!.day}-${prefData.expiredDateTime!.month}-${prefData.expiredDateTime!.year}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          var result = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1970),
                                              lastDate: DateTime(2100));
                                          await widget.preferenceDao
                                              .updatePreferenceValue(prefData!
                                                  .copyWith(
                                                      expiredDateTime: result));
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: Icon(Icons.calendar_today))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Non-Global",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 300,
                child: StreamBuilder(
                    stream: widget.nonGlobalPreferenceDao
                        .watchAllNonGlobalPreferences(widget.code),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<NonGlobalPreferenceData>? nonGloblePrefData;
                        nonGloblePrefData =
                            snapshot.data as List<NonGlobalPreferenceData>?;
                        if (nonGloblePrefData!.isEmpty) {
                          return Center(
                            child: Text(
                              "No Preference Foud",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25),
                            ),
                          );
                        }
                        //  print(prefData[1]);
                        return ListView.builder(
                          itemCount: nonGloblePrefData.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'DeviceId: ${nonGloblePrefData![index].deviceId}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textSelectionColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Container(
                                            //  height: 20,
                                            child: FlutterSwitch(
                                                value: nonGloblePrefData[index]
                                                            .value ==
                                                        'OFF'
                                                    ? false
                                                    : true,
                                                onToggle: (value) async {
                                                  await widget
                                                      .nonGlobalPreferenceDao
                                                      .updateNonGlobalPreferenceValue(
                                                          nonGloblePrefData![
                                                                  index]
                                                              .copyWith(
                                                    value: value == true
                                                        ? 'ON'
                                                        : 'OFF',
                                                  ));
                                                })),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'User: ${nonGloblePrefData[index].userName.toString()}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .textSelectionColor,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          'Screen: ${nonGloblePrefData[index].screen}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .textSelectionColor,
                                              fontSize: 16),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 7),
                                          child: Text(
                                            "${nonGloblePrefData[index].expiredDateTime!.day}-${nonGloblePrefData[index].expiredDateTime!.month}-${nonGloblePrefData[index].expiredDateTime!.year}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .textSelectionColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ])),
    );
  }

  _displayDialog(BuildContext context, callBack) async {
    return showDialog(
        barrierColor: Theme.of(context).cardColor,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Option'),
            content: TextField(
              controller: _textFieldController,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Save'),
                onPressed: () async {
                  await callBack();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
