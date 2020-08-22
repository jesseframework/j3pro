import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';


part 'sales_order_event.dart';
part 'sales_order_state.dart';

class SalesOrderBloc extends Bloc<SalesOrderEvent, SalesOrderState> {
  static final _log = Logger('SalesOrderBloc');
  SalesOrderBloc();

    @override
  SalesOrderState get initialState => SalesOrderInitial();

  @override
  Stream<SalesOrderState> mapEventToState(
    SalesOrderEvent event,
  ) async* {
    _log.finest('Bloc SalesOrder mapEventToState call');
    try {
      
    } catch (e) {
       _log.shout(e, StackTrace.current);
      yield SalesOrderFailure(error: e.toString());
    }
  }

  
}
