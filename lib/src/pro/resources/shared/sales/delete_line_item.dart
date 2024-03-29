import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:logging/logging.dart';

class DeleteSalesOrderLineItem {
  late String className = "Calculate Transaction";
  static final _log = Logger('AddItemToTransaction');
  var db;
  late SalesOrderDetailTempDao salesOrderDetailTempDao;

  DeleteSalesOrderLineItem() {
    db = MyDatabase();
    _log.finest("$className repository constructer call");
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
  }

  Future deleteLineItemById(String itemId, String uom, String transactionNo, int lineId) async {
    await salesOrderDetailTempDao.deleteLineItem(itemId, uom, transactionNo, lineId);
  }
}
