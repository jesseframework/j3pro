import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/business_rule/non_global_business_rule_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/add_item_to_transaction.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';

part 'sales_order_event.dart';
part 'sales_order_state.dart';

class SalesOrderBloc extends Bloc<SalesOrderEvent, SalesOrderState> {
  String customerId = '';

  void setId({String cusID}) {
    customerId = cusID;
  }

  get getCusID => customerId;

  static final _log = Logger('SalesOrderBloc');
  var db;
  AddItemToTransaction _addItemToTransaction;
  TempNumberLogsDao tempNumberLogsDao;
  BusinessRuleDao businessRuleDao;
  NonGlobalBusinessRuleDao nonGlobalBusinessRuleDao;
  UserSharedData userSharedData;
  Map<String, String> mapDevicePref = Map();
  SalesOrderBloc() {
    db = AppDatabase();
    _addItemToTransaction = new AddItemToTransaction();
    tempNumberLogsDao = new TempNumberLogsDao(db);
    businessRuleDao = new BusinessRuleDao(db);
    nonGlobalBusinessRuleDao = new NonGlobalBusinessRuleDao(db);

    userSharedData = new UserSharedData();
  }

  @override
  SalesOrderState get initialState => SalesOrderInitial();

  @override
  Stream<SalesOrderState> mapEventToState(
    SalesOrderEvent event,
  ) async* {
    _log.finest("decelear varable for temp number");
    String tempSalesOrderNo = "";
    String tempInventoryCycle = "";
    String tempDaySessionNumber = "";
    String tempTransactionStatus = "Pending";
    String getItemNumber = "";
    double setQty = 0;
    DateTime deliveryDate;
    String currency = "";
    double exchangeRate = 0;
    String customerId = "1000101";

    mapDevicePref = await userSharedData.getUserSharedPref();
    String userName = mapDevicePref['userName'];
    String userId = mapDevicePref['userId'];
    String deviceID = mapDevicePref['deviceID'];
    String screen = mapDevicePref['screen'];
    String tenantId = mapDevicePref['tenantId'];

    if (state is GetTransactionNumber) {
      var temNumbers = await tempNumberLogsDao.getAllSeriesNumberByType();
      for (var numbs in temNumbers) {
        if (numbs.typeOfNumber == "Sales Order") {
          tempSalesOrderNo = numbs.nextSeriesNumber;
        }

        if (numbs.typeOfNumber == "Inventory Cycle") {
          tempInventoryCycle = numbs.nextSeriesNumber;
        }

        if (numbs.typeOfNumber == "Clock Out") {
          tempDaySessionNumber = numbs.nextSeriesNumber;
        }
      }
      yield SalesOrderLoad(transactionNo: tempSalesOrderNo);
    }
  }
}
