import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_header_crud.dart';

class SalesFullAudit {
  var db;

  //Dao
  late SalesOrderDetailTempDao salesOrderDetailTempDao;
  late SalesOrderDetailDao salesOrderDetailDao;
  late SalesOrderHeaderDao salesOrderHeaderDao;

  SalesFullAudit() {
    db = MyDatabase();
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
    salesOrderDetailDao = new SalesOrderDetailDao(db);
    salesOrderHeaderDao = new SalesOrderHeaderDao(db);
  }

  Future<void> setFullAudit() async {}
}
