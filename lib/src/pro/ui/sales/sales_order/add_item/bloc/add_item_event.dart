part of 'add_item_bloc.dart';

abstract class AddItemEvent extends Equatable {
  const AddItemEvent();

  @override
  List<Object> get props => [];
}

class AddItemButtonPress extends AddItemEvent {
  final double setQty;
  final String searchText;
  final String itemNumber;
  const AddItemButtonPress(
      {@required this.searchText,
      @required this.setQty,
      @required this.itemNumber});

  @override
  List<Object> get props => [searchText, setQty, itemNumber];

  @override
  String toString() =>
      'AddItemToSalesOrderButtonPress { searchText: $searchText, '
      'setQty: $setQty,'
      'itemNuber:$itemNumber';
}

class GetTransactioNumberEvent extends AddItemEvent {}

class OnFormLoadGetTransactionNumber extends AddItemEvent {
  final String transactionNo;

  OnFormLoadGetTransactionNumber({@required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() =>
      'OnFormLoadGetTransactionNumber {transactionNo: $transactionNo}';
}
