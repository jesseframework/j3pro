import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';

void main() {
  test('test discount calculation', () async {
    String transactionNumber = "101012020";
    String itemId = "1";
    String uom = "Each";
    String transactionStatus = "Post";
    double numOfItemOnRegister = 0;
    double minPurchaseOfItemOnRegister = 0;
    var db;
    db = MyDatabase();
    SalesOrderDetailTempDao salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);

    salesOrderDetailTempDao.qtyOfItemOnRegister(transactionNumber, itemId, uom, transactionStatus).listen((e) {
      numOfItemOnRegister = e.single.quantity;
      minPurchaseOfItemOnRegister = e.single.subTotal;
      print(numOfItemOnRegister.toString());
      print(e.single.subTotal.toString());
      print(e.single.transactionNumber);
    });

    expect(numOfItemOnRegister, minPurchaseOfItemOnRegister);
  });
}
