part of 'sales_order_bloc.dart';

abstract class SalesOrderEvent extends Equatable {
  const SalesOrderEvent();

  // @override
  // List<Object> get props => [];

}

class AddItemToSalesOrderButtonPress extends SalesOrderEvent {
  final int setQty;
  final String searchText;
  const AddItemToSalesOrderButtonPress(
      {@required this.searchText, @required this.setQty});

  @override
  List<Object> get props => [searchText, setQty];

  @override
  String toString() =>
      'AddItemToSalesOrderButtonPress { searchText: $searchText, '
      'setQty: $setQty';
}
