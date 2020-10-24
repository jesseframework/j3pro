import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:logging/logging.dart';

class CalculateTotal {
  String className = "Calculate Transaction";
  var db;
  static final _log = Logger('AddItemToTransaction');
  SalesOrderDetailTempDao salesOrderDetailTempDao;

  CalculateTotal() {
    db = AppDatabase();
    _log.finest("$className repository constructer call");

    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
  }
  Future<void> getTotal(String transactionNumber, String transactionStatus) {
    salesOrderDetailTempDao.transactionTotal(
        transactionNumber, transactionStatus);
  }
}
