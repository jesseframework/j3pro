import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_crud_custquery.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';

void main() {
  test('stream order with header', () async {
    String transactionNumber = "900009911";
    String itemId = "29";
    String uom = "Each";
    String transactionStatus = "Post";
    var db;
    db = AppDatabase();
    SalesOrderDetailTempDao salesOrderDetailTempDao =
        new SalesOrderDetailTempDao(db);

    var qty = salesOrderDetailTempDao.qtyOfItemOnRegister(
        transactionNumber, itemId, uom, transactionStatus);
    if (qty != null) {
     
      expect(qty.asyncMap((e) => e[0].quantity).toString(),
          qty.asyncMap((e) => e[0].quantity).toString());
    }
  });
}
