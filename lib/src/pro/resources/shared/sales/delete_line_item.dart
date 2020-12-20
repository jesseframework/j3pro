import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:logging/logging.dart';

class DeleteSalesOrderLineItem {
  String className = "Calculate Transaction";
  static final _log = Logger('AddItemToTransaction');
  var db;
  SalesOrderDetailTempDao salesOrderDetailTempDao;

  DeleteSalesOrderLineItem() {
    db = AppDatabase();
    _log.finest("$className repository constructer call");
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
  }

  Future deleteLineItemById(
      String itemId, String uom, String transactionNo, int lineId) async {
    await salesOrderDetailTempDao.deleteLineItem(
        itemId, uom, transactionNo, lineId);
  }
}
