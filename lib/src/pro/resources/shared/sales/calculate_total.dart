import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart' as moor;

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
  Future<void> getTotal(String tempSalesOrderNo, String tempTransactionStatus,
      String itemId, String uom) async {
    var onRegister = await salesOrderDetailTempDao.getAllSalesOrderForUpdate(
        tempSalesOrderNo, tempTransactionStatus, itemId, uom);
    if (onRegister.length > 0 && onRegister != null) {
      var lineUpdate = new SalesOrderDetailTempCompanion(
          grandTotal: moor.Value((onRegister.single.subTotal +
                  onRegister.single.taxTotal +
                  onRegister.single.shippingTotal) -
              onRegister.single.lineDiscountTotal));
      await salesOrderDetailTempDao.updateInvoiceGrandTotal(
          lineUpdate, tempSalesOrderNo, tempTransactionStatus, itemId, uom);
    }
    // salesOrderDetailTempDao.transactionTotal(
    //     tempSalesOrderNo, tempTransactionStatus);
  }
}
