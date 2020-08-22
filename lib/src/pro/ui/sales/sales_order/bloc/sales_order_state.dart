part of 'sales_order_bloc.dart';

abstract class SalesOrderState extends Equatable {
  const SalesOrderState();
  
  @override
  List<Object> get props => [];
}

class SalesOrderInitial extends SalesOrderState {}

class SalesOrderItemFound extends SalesOrderState {}

class SalesOrderItemNotFound extends SalesOrderState {}

class SalesOrderFailure extends SalesOrderState {
  final String error;

  const SalesOrderFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

