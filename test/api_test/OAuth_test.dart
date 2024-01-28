import 'package:chopper/chopper.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/resources/api_clients/api_client.dart';
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;

void main() async {
  test("O Auth Test", () async {
    // final client = await oauth2.resourceOwnerPasswordGrant(Uri.parse('https://uat-auth.quickstoreapp.com:10442/connect/token'), 'admin', 'P@88w0rd',
    //     scopes: ['QuickStore'], identifier: 'QuickStore_App', secret: '');
    // print(client.credentials);
    ChopperClient chopperClient = await ApiClient.updateClient("");
    print(chopperClient);
  });
}
