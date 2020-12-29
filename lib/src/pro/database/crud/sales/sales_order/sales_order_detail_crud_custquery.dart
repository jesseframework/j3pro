import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_detail_model.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_header_model.dart';
import 'package:moor/moor.dart';

part 'sales_order_detail_crud_custquery.g.dart';

@UseMoor(
  tables: [SalesOrderHeader, SalesOrderDetail],
  queries: {
    'salesOrderWithLineItem':
        'SELECT h.* FROM sales_order_header h inner join sales_order_detail d on h.transaction_number = d.transaction_number;'
  },
)

class SalesOrderWithItem extends _$SalesOrderWithItem {

  SalesOrderWithItem(QueryExecutor e) : super(e);  
  int get schemaVersion => 1;
}

