import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sales_order_finalize_event.dart';
part 'sales_order_finalize_state.dart';

class SalesOrderFinalizeBloc
    extends Bloc<SalesOrderFinalizeEvent, SalesOrderFinalizeState> {
  @override
  SalesOrderFinalizeState get initialState => SalesOrderFinalizeInitial();
  @override
  Stream<SalesOrderFinalizeState> mapEventToState(
    SalesOrderFinalizeEvent event,
  ) async* {}
}
