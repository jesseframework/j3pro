import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/add_item_to_transaction.dart';
import 'package:logging/logging.dart';


part 'sales_order_event.dart';
part 'sales_order_state.dart';

class SalesOrderBloc extends Bloc<SalesOrderEvent, SalesOrderState> {
  static final _log = Logger('SalesOrderBloc');
  AddItemToTransaction _addItemToTransaction;
  SalesOrderBloc(){
    _addItemToTransaction=AddItemToTransaction();
  }

    @override
  SalesOrderState get initialState => SalesOrderInitial();

  @override
  Stream<SalesOrderState> mapEventToState(
    SalesOrderEvent event,
  ) async* {
    if(event is AddItemButtonPress){
    _addItemToTransaction.getItem(
      , searchText, tempSalesOrderNo, tempTransactionStatus, tempInventoryCycle, tempDaySessionNumber, deliveryDate, currency, exchangeRate, tenantId, userName, userId);
    }
    
    _log.finest('Bloc SalesOrder mapEventToState call');
    try {
      
    } catch (e) {
       _log.shout(e, StackTrace.current);
      yield SalesOrderFailure(error: e.toString());
    }
  }

  
}
