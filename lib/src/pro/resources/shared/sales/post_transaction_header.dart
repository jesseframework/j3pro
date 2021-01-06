import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_header_crud.dart';
import 'package:moor/moor.dart' as moor;

class PostTransactionHeader {
  //Other

  String result;
  var db;

  SalesOrderHeaderDao salesOrderHeaderDao;
  JourneyPlanDao journeyPlanDao;

  PostTransactionHeader() {
    db = AppDatabase();
    salesOrderHeaderDao = new SalesOrderHeaderDao(db);
    journeyPlanDao = new JourneyPlanDao(db);
  }

  Future<void> postTransactionData(
      String customerId,
      String currencyCode,
      double exchangeRate,
      String purchaseOrderNo,
      String transactionType,
      String transactionNumber,
      String transactionStatus,
      String inventoryCycleNumber,
      String daySessionNumber,
      String orderType,
      String userName,
      int userId,
      int tenantId,
      String soldTo,
      String billingAddressName,
      String shippingAddressName,
      DateTime deliveryDate) async {
    if (transactionType == "Sales Order") {
      //Sales Order Header

      var salesHeader = new SalesOrderHeaderCompanion(
          transactionNumber: moor.Value(transactionNumber),
          transactionStatus: moor.Value("InProgress"),
          inventoryCycleNumber: moor.Value(inventoryCycleNumber),
          daySessionNumber: moor.Value(daySessionNumber),
          customerId: moor.Value(customerId),
          soldTo: moor.Value(soldTo),
          orderDate: moor.Value(DateTime.now()),
          deliveryDate: moor.Value(deliveryDate),
          orderType: moor.Value(orderType),
          orderStatus: moor.Value("Waiting"),
          purchaseOrderNo: moor.Value(purchaseOrderNo),
          currency: moor.Value(currencyCode),
          exchangeRate: moor.Value(exchangeRate),
          tenantId: moor.Value(tenantId),
          couponCode: moor.Value(0),
          billingAddressName: moor.Value(billingAddressName),
          shippingAddressName: moor.Value(shippingAddressName),
          yourInitial: moor.Value(""),
          subTotal: moor.Value(0),
          taxTotal: moor.Value(0),
          depositTotal: moor.Value(0),
          discountTotal: moor.Value(0),
          shippingTotal: moor.Value(0),
          itemCount: moor.Value(0),
          grandTotal: moor.Value(0),
          discountType: moor.Value(""),
          discountPercentage: moor.Value(0),
          discountAmount: moor.Value(0),
          userName: moor.Value(userName),
          userId: moor.Value(userId),
          latitude: moor.Value(0),
          longitude: moor.Value(0),
          transactionStart: moor.Value(DateTime.now()),
          transactionEnd: moor.Value(DateTime.now()));

      await salesOrderHeaderDao.tempInsertSalesOrderHeader(salesHeader);

      var updateJplan =
          new JourneyPlanCompanion(transactionStatus: moor.Value("InProgress"));

      await journeyPlanDao.updateTransactionStatus(
          updateJplan, customerId, userName, transactionStatus);
    }
    if (transactionType == "Sales Invoice") {}

    //Move Stock
  }
}