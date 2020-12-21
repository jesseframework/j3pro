import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/business_rule/non_global_business_rule_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/add_item_to_transaction.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
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
  AddItemBloc() {
    db = AppDatabase();
    _addItemToTransaction = new AddItemToTransaction();
    tempNumberLogsDao = new TempNumberLogsDao(db);
    businessRuleDao = new BusinessRuleDao(db);
    nonGlobalBusinessRuleDao = new NonGlobalBusinessRuleDao(db);

    userSharedData = new UserSharedData();
  }

  @override
  AddItemState get initialState => AddItemInitial();

  @override
  Stream<AddItemState> mapEventToState(
    AddItemEvent event,
  ) async* {
    yield AddItemLoading();
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
    if (state is AddItemLoading) {
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
      yield GetTransactionNumber(transactionNo: tempSalesOrderNo);
      //yield AddItemLoad(transactionNo: tempSalesOrderNo);
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
        print(result);
      }
    }
  }
}