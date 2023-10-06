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
  final BuildContext context;
  const AddItemButtonPress(
      {required this.searchText,
      required this.setQty,
      required this.context,
      required this.itemNumber});

  @override
  List<Object> get props => [searchText, setQty, itemNumber, context];

  @override
  String toString() =>
      'AddItemToSalesOrderButtonPress { searchText: $searchText, '
      'setQty: $setQty,'
      'itemNuber:$itemNumber';
}

class DeleteLineItemPress extends AddItemEvent {
  final int id;
  final String itemNumber;
  final String uom;
  const DeleteLineItemPress(
      {required this.id, required this.itemNumber, required this.uom});

  @override
  List<Object> get props => [id, itemNumber, uom];

  @override
  String toString() => 'AddItemToSalesOrderButtonPress { id: $id, '
      'itemNuber:$itemNumber,'
      'uom:$uom';
}

class GetTransactioNumberEvent extends AddItemEvent {}

class OnFormLoadGetTransactionNumber extends AddItemEvent {
  final String transactionNo;

  OnFormLoadGetTransactionNumber({required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() =>
      'OnFormLoadGetTransactionNumber {transactionNo: $transactionNo}';
}
