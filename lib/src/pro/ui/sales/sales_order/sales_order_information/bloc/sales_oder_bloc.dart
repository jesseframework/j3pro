import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/account/exchange_rate/exchange_rate.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/post_transaction_header.dart';
import 'package:j3enterprise/src/pro/resources/shared/utils/temp_serial_number_logic.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';

part 'sales_oder_event.dart';
part 'sales_oder_state.dart';

class SalesOderBloc extends Bloc<SalesOderEvent, SalesOderState> {
  var db;
  late PostTransactionHeader postTransactionHeader;
  late UserSharedData userSharedData;
  late AddressDao addressDao;
  late JourneyPlanDao journeyPlanDao;
  late CustomerDao customerDao;
  late SystemCurrencyDao systemCurrencyDao;
  late ExchangeRateDao exchangeRateDao;
  late TempSerialNumberReader tempSerialNumberReader;
  SalesOderBloc() : super(SalesOderInitial()) {
    db = MyDatabase();
    addressDao = AddressDao(db);
    customerDao = CustomerDao(db);
    systemCurrencyDao = SystemCurrencyDao(db);
    exchangeRateDao = ExchangeRateDao(db);
    journeyPlanDao = JourneyPlanDao(db);
    postTransactionHeader = PostTransactionHeader();
    userSharedData = UserSharedData();
    tempSerialNumberReader = TempSerialNumberReader();
  }

  @override
  Stream<SalesOderState> mapEventToState(
    SalesOderEvent event,
  ) async* {
    if (event is FetchDefaultData) {
      yield SalesOderLoding();
      List<CustomerData> customerData = await customerDao.getAllCustomerById(addItemBloc.customerId);
      var defaultCurrency = customerData[0].defaultCurrency!.isNotEmpty ? customerData[0].defaultCurrency : 'JMD';
      List<SystemCurrencyData> currencydata = await systemCurrencyDao.getAllSystemCurrency();
      List<SystemCurrencyData> defaultCurrencyList = currencydata.isNotEmpty
          ? currencydata
          : [SystemCurrencyData(currencyName: 'No Currency Found', isDeleted: false, effectiveDate: DateTime.now(), id: 0, isActive: false)];
      List<ExchangeRateData> exchangeRateData = await exchangeRateDao.getAllExchnageRateByCurrency('JMD', defaultCurrency!);

      double exchangeRate = exchangeRateData[0].exchangeRate!;
      yield SalesOderDefaultData(exchangeRate: exchangeRate, defaultCurrency: defaultCurrency, currenciesData: defaultCurrencyList);
    }

    if (event is CreateSalesOrderHeader) {
      var shredPrefData = await userSharedData.getUserSharedPref();
      // List<JourneyPlanData> journeyPlanData =
      //     await journeyPlanDao.getAllJourneyPlanByCustomer(event.customerId);

      postTransactionHeader.postTransactionData(
        exchangeRate: event.exchangeRate,
        transactionNumber: await tempSerialNumberReader.getTempNumber(typeOfNumber: 'Sales Order'),
        transactionStatus: event.transactionStatus,
        daySessionNumber: await tempSerialNumberReader.getTempNumber(typeOfNumber: 'Clock In'),
        billingAddressName: event.billingAddressName,
        purchaseOrderNo: event.purchaseOrderNo,
        tenantId: shredPrefData['tenantId'],
        customerId: event.customerId,
        shippingAddressName: event.shippingAddressName,
        currencyCode: event.currencyCode,
        soldTo: event.soldTo,
        deliveryDate: event.deliveryDate,
        transactionType: event.transactionType,
        inventoryCycleNumber: await tempSerialNumberReader.getTempNumber(typeOfNumber: 'Inventory Cycle'),
        userId: int.parse(shredPrefData['userId']),
        userName: shredPrefData['userName'],
        orderType: event.orderType,
      );
    }
  }

  @override
  // TODO: implement initialState
  SalesOderState get initialState => SalesOderInitial();
}
