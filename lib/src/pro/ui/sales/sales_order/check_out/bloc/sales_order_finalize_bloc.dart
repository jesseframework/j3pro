import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/account/exchange_rate/exchange_rate.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/post_transaction.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/post_transaction_header.dart';
import 'package:j3enterprise/src/pro/resources/shared/utils/temp_serial_number_logic.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
part 'sales_order_finalize_event.dart';
part 'sales_order_finalize_state.dart';

class SalesOrderFinalizeBloc
    extends Bloc<SalesOrderFinalizeEvent, SalesOrderFinalizeState> {
  var db;
  late PostTransactionHeader postTransactionHeader;
  late UserSharedData userSharedData;
  late AddressDao addressDao;
  late JourneyPlanDao journeyPlanDao;
  late CustomerDao customerDao;
  late SystemCurrencyDao systemCurrencyDao;
  late ExchangeRateDao exchangeRateDao;
  late TempSerialNumberReader tempSerialNumberReader;
  late PostTransaction _postTransaction;

  SalesOrderFinalizeBloc() : super(SalesOrderFinalizeInitial()) {
    _postTransaction = PostTransaction();
    db = AppDatabase();
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
  SalesOrderFinalizeState get initialState => SalesOrderFinalizeInitial();
  @override
  Stream<SalesOrderFinalizeState> mapEventToState(
    SalesOrderFinalizeEvent event,
  ) async* {
    if (event is CreatePostTransection) {
      List<CustomerData> customerData =
          await customerDao.getAllCustomerById(addItemBloc.customerId);
      var defaultCurrency = customerData[0].defaultCurrency.isNotEmpty
          ? customerData[0].defaultCurrency
          : 'JMD';
      List<SystemCurrencyData> currencydata =
          await systemCurrencyDao.getAllSystemCurrency();
      List<SystemCurrencyData> defaultCurrencyList = currencydata.isNotEmpty
          ? currencydata
          : [
              SystemCurrencyData(
                  currencyName: 'No Currency Found',
                  effectiveDate: DateTime.now(),
                  id: 0,
                  isActive: false,
                  isDeleted: false)
            ];
      List<ExchangeRateData> exchangeRateData = await exchangeRateDao
          .getAllExchnageRateByCurrency('JMD', defaultCurrency);
      var shredPrefData = await userSharedData.getUserSharedPref();
      _postTransaction.postTransactionData(
        exchangeRate: exchangeRateData[0].exchangeRate,
        transactionNumber: await tempSerialNumberReader.getTempNumber(
            typeOfNumber: 'Sales Order'),
        transactionStatus: event.transactionStatus,
        daySessionNumber: await tempSerialNumberReader.getTempNumber(
            typeOfNumber: 'Clock In'),
        billingAddressName: event.billingAddressName,
        purchaseOrderNo: event.purchaseOrderNo,
        tenantId: int.parse(shredPrefData['tenantId']),
        customerId: addItemBloc.customerId,
        shippingAddressName: event.shippingAddressName,
        currencyCode: event.currencyCode,
        soldTo: event.soldTo,
        deliveryDate: event.deliveryDate,
        transactionType: event.transactionType,
        inventoryCycleNumber: await tempSerialNumberReader.getTempNumber(
            typeOfNumber: 'Inventory Cycle'),
        userId: int.parse(shredPrefData['userId']),
        userName: shredPrefData['userName'],
        orderType: event.orderType,
      );
    }
  }
}
