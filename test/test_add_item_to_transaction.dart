import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/add_item_to_transaction.dart';

void main() {
  test('stream order with header', () async {
    double qtySet = 1;
    String searchText = "19";
    String tempSalesOrderNo = "101012020";
    String tempTransactionStatus = "Post";
    String tempInventoryCycle = "INV88779899";
    String tempDaySessionNumber = "DE88999";
    DateTime deliveryDate = DateTime.now();
    String currency = "JMD";
    double exchangeRate = 1;
    int tenantId = 1;
    String userName = "admin";
    int userId = 1;
    AddItemToTransaction addItemToTransaction = new AddItemToTransaction();
    await addItemToTransaction.getItem(
        qtySet,
        searchText,
        tempSalesOrderNo,
        tempTransactionStatus,
        tempInventoryCycle,
        tempDaySessionNumber,
        deliveryDate,
        currency,
        exchangeRate,
        tenantId,
        userName,
        userId);
  });
}
