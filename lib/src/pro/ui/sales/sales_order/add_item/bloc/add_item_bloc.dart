import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/business_rule/non_global_business_rule_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/account/exchange_rate/exchange_rate.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/add_item_to_transaction.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/calculate_tax.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/calculate_total.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/delete_line_item.dart';
import 'package:j3enterprise/src/pro/resources/shared/utils/temp_serial_number_logic.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:j3enterprise/src/resources/shared/widgets/dialog.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  String tempSalesOrderNo = "";
  String tempInventoryCycle = "";
  String tempDaySessionNumber = "";
  String tempTransactionStatus = "Pending";
  String getItemNumber = "";
  double setQty = 0;
  DateTime deliveryDate;
  String currency = "";
  double exchangeRate = 0;
  String customerId = "";

  void setId({String cusID}) {
    customerId = cusID;
  }

  get getCusID => customerId;
  get getOderNumber => tempSalesOrderNo;

  static final _log = Logger('SalesOrderBloc');
  var db;
  AddItemToTransaction _addItemToTransaction;
  DeleteSalesOrderLineItem _deleteSalesOrderLineItem;
  CalculateTotal _calculateTotal;
  CalculateTax _calculateTax;
  TempNumberLogsDao tempNumberLogsDao;
  TempSerialNumberReader tempSerialNumberReader;
  BusinessRuleDao businessRuleDao;
  CustomerDao customerDao;
  SystemCurrencyDao systemCurrencyDao;
  ExchangeRateDao exchangeRateDao;
  NonGlobalBusinessRuleDao nonGlobalBusinessRuleDao;
  UserSharedData userSharedData;
  Map<String, String> mapDevicePref = Map();
  AddItemBloc() {
    db = AppDatabase();

    tempSerialNumberReader = new TempSerialNumberReader();
    _addItemToTransaction = new AddItemToTransaction();
    _deleteSalesOrderLineItem = new DeleteSalesOrderLineItem();
    _calculateTax = new CalculateTax();
    _calculateTotal = new CalculateTotal();
    tempNumberLogsDao = new TempNumberLogsDao(db);
    customerDao = new CustomerDao(db);
    businessRuleDao = new BusinessRuleDao(db);
    systemCurrencyDao = new SystemCurrencyDao(db);
    exchangeRateDao = new ExchangeRateDao(db);
    nonGlobalBusinessRuleDao = new NonGlobalBusinessRuleDao(db);
    userSharedData = new UserSharedData();
  }

  void setOrderNumber() async {
    tempSalesOrderNo =
        await tempSerialNumberReader.getTempNumber(typeOfNumber:"Sales Order");
    tempInventoryCycle =
        await tempSerialNumberReader.getTempNumber(typeOfNumber:"Inventory Cycle");
    tempDaySessionNumber =
        await tempSerialNumberReader.getTempNumber(typeOfNumber:"Clock In");
  }

  @override
  AddItemState get initialState => AddItemInitial();

  @override
  Stream<AddItemState> mapEventToState(
    AddItemEvent event,
  ) async* {
    yield AddItemLoading();
    _log.finest("get temp number from database");
    tempSalesOrderNo =
        await tempSerialNumberReader.getTempNumber(typeOfNumber: "Sales Order");
    tempInventoryCycle =
        await tempSerialNumberReader.getTempNumber(typeOfNumber:"Inventory Cycle");
    tempDaySessionNumber =
        await tempSerialNumberReader.getTempNumber(typeOfNumber:"Clock In");

    _log.finest("get customer by customer number");
    var cust = await customerDao.getAllCustomerById(customerId);
    if (cust.length > 0) {
      currency = cust[0].defaultCurrency;
    }

    //ToDo add effictive date to exchange rate
    //ToDo get company exchange rate

    var getexchangeRate =
        await exchangeRateDao.getAllExchnageRateByCurrency("JMD", currency);
    if (getexchangeRate.length > 0) {
      exchangeRate = getexchangeRate[0].exchangeRate;
    }

    mapDevicePref = await userSharedData.getUserSharedPref();
    String userName = mapDevicePref['userName'];
    String userId = mapDevicePref['userId'];
    String deviceID = mapDevicePref['deviceID'];
    String screen = mapDevicePref['screen'];
    String tenantId = mapDevicePref['tenantId'];
    if (state is AddItemLoading) {
      yield GetTransactionNumber(transactionNo: tempSalesOrderNo);
    }

    //Business Rule for delivery date
    var setDeliveryDate =
        await businessRuleDao.getSingleBusinessRule('SETDDDATE');
    if (setDeliveryDate != null) {
      if (setDeliveryDate.value == "ON" &&
          setDeliveryDate.isGlobalRule == false &&
          (setDeliveryDate.expiredDateTime.isAfter(DateTime.now()) ||
              setDeliveryDate.expiredDateTime == null)) {
        var nonGlobalDb =
            await nonGlobalBusinessRuleDao.getSingleNonGlobalBusinessRule(
                'SETDDDATE', 'SETDDDATE', userName, deviceID, screen);
        if (nonGlobalDb != null &&
            nonGlobalDb.value == "ON" &&
            nonGlobalDb.isApply == true) {
          //Set not global
          if (nonGlobalDb.expiredDateTime.isAfter(DateTime.now()) ||
              nonGlobalDb.expiredDateTime == null) {
            deliveryDate = DateTime.now();
          }
        }
      } else {
        deliveryDate = DateTime.now();
      }
    } else {
      //Set Default
      deliveryDate = DateTime.now();
    }

    if (event is AddItemButtonPress) {
      getItemNumber = event.itemNumber;
      setQty = event.setQty;
      if (setQty != null) {
      } else {
        setQty = 1;
      }
      var result = await _addItemToTransaction.getItem(
          setQty,
          getItemNumber,
          tempSalesOrderNo,
          tempTransactionStatus,
          tempInventoryCycle,
          tempDaySessionNumber,
          deliveryDate,
          currency,
          exchangeRate,
          int.tryParse(tenantId),
          userName,
          int.tryParse(userId),
          customerId);

      if (result != null) {
        displayDialog(
            onlyMessage: true,
            title: result.toString(),
            context: event.context);
      }
    }

    if (event is DeleteLineItemPress) {
      var result = await _deleteSalesOrderLineItem.deleteLineItemById(
          event.itemNumber, event.uom, tempSalesOrderNo, event.id);

      await _calculateTotal.getTotal(
          tempSalesOrderNo, tempTransactionStatus, event.itemNumber, event.uom);

      if (result != null) {
        print(result);
      }
    }
  }
}

final addItemBloc = AddItemBloc();
