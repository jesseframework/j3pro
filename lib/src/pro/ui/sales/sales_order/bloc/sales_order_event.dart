part of 'sales_order_bloc.dart';

abstract class SalesOrderEvent extends Equatable {
  const SalesOrderEvent();

  // @override
  // List<Object> get props => [];

}

class AddItemButtonPress extends SalesOrderEvent {
  final double setQty;
  final String searchText;
  final String itemNumber;
  const AddItemButtonPress(
      {@required this.searchText, @required this.setQty,@required this.itemNumber});

  @override
  List<Object> get props => [searchText, setQty,itemNumber];

  @override
  String toString() =>
      'AddItemToSalesOrderButtonPress { searchText: $searchText, '
      'setQty: $setQty,' 'itemNuber:$itemNumber';
}
class GetTransactionNumber extends SalesOrderEvent {
   final String transactionNo;

  GetTransactionNumber({@required this.transactionNo});

  @override
  List<Object> get props => [transactionNo];

  @override
  String toString() =>
      'GetTransactionNumber {transactionNo: $transactionNo}';
  
}
 