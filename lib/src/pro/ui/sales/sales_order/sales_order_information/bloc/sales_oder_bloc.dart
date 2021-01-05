import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/account/exchange_rate/exchange_rate.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';

part 'sales_oder_event.dart';
part 'sales_oder_state.dart';

class SalesOderBloc extends Bloc<SalesOderEvent, SalesOderState> {
  List<SystemCurrencyData> defaultCurrencyList = [];
  var db;

  AddressDao addressDao;
  CustomerDao customerDao;
  SystemCurrencyDao systemCurrencyDao;
  ExchangeRateDao exchangeRateDao;
  SalesOderBloc() {
    db = AppDatabase();
    addressDao = AddressDao(db);
    customerDao = CustomerDao(db);
    systemCurrencyDao = SystemCurrencyDao(db);
    exchangeRateDao = ExchangeRateDao(db);
  }
  
  @override
  Stream<SalesOderState> mapEventToState(
    SalesOderEvent event,
  ) async* {
    yield SalesOderLoding();
    List<CustomerData> customerData =
        await customerDao.getAllCustomerById(addItemBloc.customerId);
    var defaultCurrency = customerData[0].defaultCurrency.isNotEmpty
        ? customerData[0].defaultCurrency
        : 'JMD';
    List<SystemCurrencyData> currencydata =
        await systemCurrencyDao.getAllSystemCurrency();
   defaultCurrencyList = currencydata.isNotEmpty
        ? currencydata
        : [SystemCurrencyData(currencyName: 'No Currency Found')];
    List<ExchangeRateData> exchangeRateData = await exchangeRateDao
        .getAllExchnageRateByCurrency('JMD', defaultCurrency);

    double exchangeRate = exchangeRateData[0].exchangeRate;
    yield SalesOderDefaultData(exchangeRate: exchangeRate,defaultCurrency: defaultCurrency,currenciesData: defaultCurrencyList);
  }

  @override
  // TODO: implement initialState
  SalesOderState get initialState => SalesOderInitial();

   
}
