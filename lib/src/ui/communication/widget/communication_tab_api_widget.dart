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

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/widgets/dropdown_box.dart';
import 'package:j3enterprise/src/resources/shared/widgets/password_field.dart';
import 'package:j3enterprise/src/resources/shared/widgets/text_field_nullable.dart';
import 'package:j3enterprise/src/ui/communication/bloc/communication_bloc.dart';
import 'package:moor/moor.dart' as moor;

class CommunicationTabTwoWidget extends StatefulWidget {
  @override
  _CommunicationTabTwoWidgetState createState() =>
      _CommunicationTabTwoWidgetState();
}

class _CommunicationTabTwoWidgetState extends State<CommunicationTabTwoWidget> {
  final formKey = new GlobalKey<FormState>();

  //Drop down setting0
  var syncApifrequencySelectedItem;
  final String apiConnection = 'API';

  //Form field
  var _apiserverurlController = TextEditingController();
  var _apiusernameController = TextEditingController();
  var _apiConfirmPasswordController = TextEditingController();

  _onUpdateeApiFrequencySelection(String value) {
    setState(() {
      syncApifrequencySelectedItem = value;
    });
  }

  List<CommunicationData> _communicationData;

  //API comeunication Setting
  Future<void> submitAPITab(CommunicationBloc bloc) async {
    try {
      formKey.currentState.validate();

      final plainText = _apiConfirmPasswordController.value.text;
      final key = encrypt.Key.fromUtf8('66yencbsgtTYOL78wsabzpmaQQzduerp');
      final iv = encrypt.IV.fromLength(16);

      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      final encrypted = encrypter.encrypt(plainText, iv: iv);
      //final decrypted = encrypter.decrypt(encrypted, iv: iv);

      var formData = CommunicationCompanion(
        serverUrl: moor.Value(_apiserverurlController.value.text),
        userName: moor.Value(_apiusernameController.value.text),
        confirmPasskey: moor.Value(encrypted.base64),
        syncFrequency: moor.Value(syncApifrequencySelectedItem),
        communicationType: moor.Value(apiConnection),
      );

      var createEvent = SaveCommunicationButtonPressed(data: formData);
      if (_communicationData != null) {
        var updateEvent = UpdateAPICommunicationButtonPressed(data: formData);
        bloc.add(updateEvent);
      } else {
        bloc.add(createEvent);
      }
    } catch (e) {}
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    try {
      return BlocProvider(
        create: (context) {
          return CommunicationBloc();
        },
        child: BlocConsumer<CommunicationBloc, CommunicationState>(
          listener: (context, state) {
            if (state is CommunicationLoadSuccess) {
              // if data was loaded set it
              _communicationData = state.data;

              _setupControllers();
            }
          },
          buildWhen: (previous, current) {
            var wasLoading = previous is CommunicationLoading;
            return wasLoading;
          },
          builder: (context, state) {
            var bloc = BlocProvider.of<CommunicationBloc>(context);
            // check what state we are in
            if (state is CommunicationLoadSuccess) {
              // if data was loaded set it
              _communicationData = state.data;

              //_setupControllers();
            } else if (_communicationData == null) {
              // else if data is not present retrieve it
              var loadEvent = OnFormLoadGetSaveCommunication(
                  communicationType: apiConnection);
              bloc.add(loadEvent);
            }
            // return form
            return _buildForm(bloc);
          },
        ),
      );
    } catch (e) {}
  }

  void _setupControllers() {
    try {
      if (_communicationData != null && _communicationData.length > 0) {
        _apiserverurlController =
            TextEditingController(text: _communicationData[0].serverUrl);
        _apiusernameController =
            TextEditingController(text: _communicationData[0].userName);
        _apiConfirmPasswordController =
            TextEditingController(text: _communicationData[0].confirmPasskey);

        syncApifrequencySelectedItem = _communicationData[0].syncFrequency;
      }
    } catch (e) {}
  }

  // ignore: missing_return
  Widget _buildForm(CommunicationBloc bloc) {
    try {
      return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0.00),
                child: TextFromFieldNullableReusable(
                  fieldDecoration: InputDecoration(
                    labelText: AppLocalization.of(context)
                            .translate('server_url_label_communication') ??
                        'Server Url',
                  ),
                  controllerName: _apiserverurlController,
                  validationText: 'Test',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.00),
                child: TextFromFieldNullableReusable(
                  fieldDecoration: InputDecoration(
                    labelText: AppLocalization.of(context)
                            .translate('username_label_communication') ??
                        'Username',
                  ),
                  controllerName: _apiusernameController,
                  validationText: 'Test',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.00),
                child: TextFromFieldPasswordReusable(
                  fieldDecoration: InputDecoration(
                    labelText: AppLocalization.of(context)
                            .translate('new_password_label_communication') ??
                        'New Password',
                  ),
                  validationText: 'Test',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.00),
                child: TextFromFieldPasswordReusable(
                  fieldDecoration: InputDecoration(
                    labelText: AppLocalization.of(context).translate(
                            'confirm_password_label_communication') ??
                        'Confirm Password',
                  ),
                  controllerName: _apiConfirmPasswordController,
                  validationText: 'Test',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.00),
                child: DropdownFormFieldNormalReuse(
                  _onUpdateeApiFrequencySelection,
                  hintText: AppLocalization.of(context)
                          .translate('sync_frequency_label_communication') ??
                      'Sync Frequency',
                  selectedValue: syncApifrequencySelectedItem,
                  listData: [
                    'Every Minet',
                    'Every 5 Minutes',
                    'Every 20 Minutes',
                    'Every Day',
                    'Every Month',
                    'Every Year'
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.00),
                child: ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    color: Colors.green[400],
                    onPressed: () {
                      submitAPITab(bloc);
                    },
                    child: Center(
                        child: Text(
                      AppLocalization.of(context)
                              .translate('save_changes_button_serversetup') ??
                          'Save Changes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {}
  }
}
