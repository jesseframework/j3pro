part of 'sales_order_bloc.dart';

abstract class SalesOrderState extends Equatable {
  const SalesOrderState();
  
  @override
  List<Object> get props => [];
}

class SalesOrderInitial extends SalesOrderState {
   
}

class SalesOrderLoad extends SalesOrderState {
   final String transactionNo;

  const SalesOrderLoad({@required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() => 'SalesOrderLoad { data: $transactionNo }';
}

class SalesOrderItemFound extends SalesOrderState {}

class SalesOrderItemNotFound extends SalesOrderState {}

class SalesOrderSuccess extends SalesOrderState {
  //final BackgroundJobScheduleCompanion data;
  final userMessage;
  const SalesOrderSuccess({@required this.userMessage});

  @override
  List<Object> get props => [userMessage];

  @override
  String toString() => 'SalesOrderSuccess { userMessage: $userMessage }';
}

class SalesOrderFailure extends SalesOrderState {
  final String error;

  const SalesOrderFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

