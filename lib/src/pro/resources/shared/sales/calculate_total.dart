import 'package:intl/intl.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;

class CalculateTotal {
  late String className = "Calculate Transaction";
  var db;
  static final _log = Logger('AddItemToTransaction');
  late SalesOrderDetailTempDao salesOrderDetailTempDao;
  late SystemCurrencyDao systemCurrencyDao;

  CalculateTotal() {
    db = MyDatabase();
    _log.finest("$className repository constructer call");

    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
    systemCurrencyDao = new SystemCurrencyDao(db);
  }
  Future<void> getTotal(String tempSalesOrderNo, String tempTransactionStatus, String itemId, String uom) async {
    var onRegister = await salesOrderDetailTempDao.getAllSalesOrderForUpdate(tempSalesOrderNo, tempTransactionStatus, itemId, uom);
    if (onRegister.length > 0 && onRegister != null) {
      //ToDo Add location to currency
      double formatedGrandTotal = 0;
      double unformatedGrandTotal =
          (onRegister.single.subTotal + onRegister.single.taxTotal! + onRegister.single.shippingTotal) - onRegister.single.lineDiscountTotal!;

      var currency = await systemCurrencyDao.getAllSystemCurrencyByName("JMD");
      if (currency.length > 0) {
        var f = new NumberFormat(currency[0].numberFormat, "en_US");
        formatedGrandTotal = double.tryParse(f.format(unformatedGrandTotal))!;
      } else {
        var f = new NumberFormat("###.0#", "en_US");
        formatedGrandTotal = double.tryParse(f.format(unformatedGrandTotal))!;
      }
      var lineUpdate = new SalesOrderDetailTempCompanion(grandTotal: moor.Value(formatedGrandTotal));
      await salesOrderDetailTempDao.updateInvoiceGrandTotal(lineUpdate, tempSalesOrderNo, tempTransactionStatus, itemId, uom);
    }
    // salesOrderDetailTempDao.transactionTotal(
    //     tempSalesOrderNo, tempTransactionStatus);
  }
}
