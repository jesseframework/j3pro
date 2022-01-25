part of 'add_item_bloc.dart';

abstract class AddItemState extends Equatable {
  const AddItemState();

  @override
  List<Object> get props => [];
}

class AddItemInitial extends AddItemState {
  final String transactionNo;

  AddItemInitial({required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() => 'GetTransactionNumber {transactionNo: $transactionNo}';
}

class AddItemLoading extends AddItemState {}

class GetTransactionNumber extends AddItemState {
  final String transactionNo;

  GetTransactionNumber({required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() => 'GetTransactionNumber {transactionNo: $transactionNo}';
}

class AddItemLoad extends AddItemState {
  final String transactionNo;

  const AddItemLoad({required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() => 'SalesOrderLoad { data: $transactionNo }';
}
