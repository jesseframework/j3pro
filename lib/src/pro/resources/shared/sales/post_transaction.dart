import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/contact_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_header_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/series_number_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/transfer_inventory.dart';
import 'package:j3enterprise/src/pro/resources/shared/utils/series_number_generator.dart';
import 'package:drift/drift.dart' as moor;

class PostTransaction {
  //Other

  late String result;
  var db;
  var salesDetailData;
  late NumberGenerator numberGenerator;
  late TransferInventory transferInventory;

  //Dto
  late SalesOrderDetailTempDao salesOrderDetailTempDao;
  late SalesOrderDetailDao salesOrderDetailDao;
  late SalesOrderHeaderDao salesOrderHeaderDao;
  late InventoryItemsDao inventoryItemsDao;
  late CustomerDao customerDao;
  late ContactDao contactDao;
  late AddressDao addressDao;
  late SeriesNumberGeneratorDao seriesNumberGeneratorDao;
  late TempNumberLogsDao tempNumberLogsDao;

  PostTransaction() {
    db = MyDatabase();
    numberGenerator = new NumberGenerator();
    transferInventory = new TransferInventory();
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
    salesOrderDetailDao = new SalesOrderDetailDao(db);
    salesOrderHeaderDao = new SalesOrderHeaderDao(db);
    inventoryItemsDao = new InventoryItemsDao(db);
    customerDao = new CustomerDao(db);
    contactDao = new ContactDao(db);
    addressDao = new AddressDao(db);
    seriesNumberGeneratorDao = new SeriesNumberGeneratorDao(db);
    tempNumberLogsDao = new TempNumberLogsDao(db);
  }

  Future<void> postTransactionData(
      {String? customerId,
      String? currencyCode,
      double? exchangeRate,
      String? purchaseOrderNo,
      String? transactionType,
      String? transactionNumber,
      String? transactionStatus,
      String? inventoryCycleNumber,
      String? daySessionNumber,
      String? orderType,
      String? userName,
      int? userId,
      int? tenantId,
      String? soldTo,
      String? billingAddressName,
      String? shippingAddressName,
      double? latitude,
      double? longitude,
      DateTime? deliveryDate}) async {
    if (transactionType == "Sales Order") {
      //Sales Order Header
      double subTotal = 0;
      double taxTotal = 0;
      double depositTotal = 0;
      double discountTotal = 0;
      double shippingTotal = 0;
      int itemCount = 0;
      double grandTotal = 0;
      String discountType = "";
      double discountPercentage = 0;
      double discountAmount = 0;

      var getCustomer = await customerDao.getAllCustomerById(customerId!);
      if (getCustomer.length > 0 && getCustomer != null) {}

      var salesDetail = await salesOrderDetailTempDao.getAllSalesOrderDetailTemp(transactionNumber!, transactionStatus!);
      for (var detail in salesDetail) {
        salesDetailData = new SalesOrderDetailCompanion(
            userName: moor.Value(detail.userName),
            userId: moor.Value(detail.userId),
            transactionNumber: moor.Value(detail.transactionNumber),
            transactionStatus: moor.Value("Post"),
            inventoryCycleNumber: moor.Value(detail.inventoryCycleNumber!),
            daySessionNumber: moor.Value(detail.daySessionNumber!),
            deliveryDate: moor.Value(detail.deliveryDate!),
            currency: moor.Value(detail.currency!),
            exchangeRate: moor.Value(detail.exchangeRate!),
            itemId: moor.Value(detail.itemId),
            itemCode: moor.Value(detail.itemCode),
            upcCode: moor.Value(detail.upcCode!),
            description: moor.Value(detail.description),
            itemGroup: moor.Value(detail.itemGroup!),
            category: moor.Value(detail.category!),
            salesUOM: moor.Value(detail.salesUOM!),
            stockUOM: moor.Value(detail.stockUOM!),
            taxGroup: moor.Value(detail.taxGroup!),
            warehouse: moor.Value(detail.warehouse!),
            discountType: moor.Value(detail.discountType!),
            discountPercentage: moor.Value(detail.discountPercentage!),
            discountAmount: moor.Value(detail.discountAmount!),
            lineDiscountTotal: moor.Value(detail.lineDiscountTotal!),
            unitPrice: moor.Value(detail.unitPrice),
            costPrice: moor.Value(detail.costPrice!),
            listPrice: moor.Value(detail.listPrice!),
            quantity: moor.Value(detail.quantity),
            subTotal: moor.Value(detail.subTotal),
            grandTotal: moor.Value(detail.grandTotal),
            taxTotal: moor.Value(detail.taxTotal!),
            shippingTotal: moor.Value(detail.shippingTotal),
            conversionFactor: moor.Value(detail.conversionFactor!));
      }

      salesOrderDetailTempDao.transactionTotal(transactionNumber, transactionStatus).listen((e) {
        if (e.isNotEmpty) {
          subTotal = e.single.subTotal;
          taxTotal = e.single.taxTotal!;
          depositTotal = e.single.depositTotal!;
          discountTotal = e.single.lineDiscountTotal!;
          shippingTotal = e.single.shippingTotal;
          itemCount = e.single.itemCount!;
          grandTotal = e.single.grandTotal;
          discountType = e.single.discountType!;
          discountPercentage = e.single.discountPercentage!;
          discountAmount = e.single.discountAmount!;
        }
      });

      var salesHeader = new SalesOrderHeaderCompanion(
          transactionNumber: moor.Value(transactionNumber),
          transactionStatus: moor.Value("Post"),
          inventoryCycleNumber: moor.Value(inventoryCycleNumber!),
          daySessionNumber: moor.Value(daySessionNumber!),
          customerId: moor.Value(customerId),
          soldTo: moor.Value(soldTo),
          orderDate: moor.Value(DateTime.now()),
          deliveryDate: moor.Value(deliveryDate!),
          orderType: moor.Value(orderType!),
          orderStatus: moor.Value("Waiting"),
          purchaseOrderNo: moor.Value(purchaseOrderNo),
          currency: moor.Value(currencyCode!),
          exchangeRate: moor.Value(exchangeRate!),
          tenantId: moor.Value(tenantId),
          couponCode: moor.Value(0),
          billingAddressName: moor.Value(billingAddressName),
          shippingAddressName: moor.Value(shippingAddressName),
          yourInitial: moor.Value(""),
          subTotal: moor.Value(subTotal),
          taxTotal: moor.Value(taxTotal),
          depositTotal: moor.Value(depositTotal),
          discountTotal: moor.Value(discountTotal),
          shippingTotal: moor.Value(shippingTotal),
          itemCount: moor.Value(itemCount),
          grandTotal: moor.Value(grandTotal),
          discountType: moor.Value(discountType),
          discountPercentage: moor.Value(discountPercentage),
          discountAmount: moor.Value(discountAmount),
          userName: moor.Value(userName!),
          userId: moor.Value(userId!),
          latitude: moor.Value(latitude),
          longitude: moor.Value(longitude),
          transactionEnd: moor.Value(DateTime.now()));

      var isPost = await salesOrderDetailDao.postSalesOrderData(salesDetailData, salesHeader);

      if (isPost == true) {
        var lastInvoice = await salesOrderHeaderDao.getAllSalesOrderHeader();
        if (lastInvoice.length > 0) {
          var sn = await seriesNumberGeneratorDao.getAllSeriesNumberByType(transactionType!);
          if (sn.length > 0 && sn != null) {
            await numberGenerator.getSerialNumber(transactionType, lastInvoice.length, sn.single.endingLength!);

            var tempNumber = new TempNumberLogsCompanion(
                tenantId: moor.Value(0),
                nextSeriesNumber: moor.Value(numberGenerator.toString()),
                lastSeriesNumber: moor.Value(transactionNumber),
                lastUsageDate: moor.Value(DateTime.now()),
                userName: moor.Value(""),
                typeOfNumber: moor.Value(transactionType));

            await tempNumberLogsDao.createOrUpdateTempNumber(tempNumber);
          }
        } else {
          var sn = await seriesNumberGeneratorDao.getAllSeriesNumberByType(transactionType!);
          if (sn.length > 0 && sn != null) {
            await numberGenerator.getSerialNumber(transactionType, 0, sn.single.endingLength!);

            var tempNumber = new TempNumberLogsCompanion(
                tenantId: moor.Value(0),
                nextSeriesNumber: moor.Value(numberGenerator.toString()),
                lastSeriesNumber: moor.Value(transactionNumber),
                lastUsageDate: moor.Value(DateTime.now()),
                userName: moor.Value(""),
                typeOfNumber: moor.Value(transactionType));

            await tempNumberLogsDao.createOrUpdateTempNumber(tempNumber);
          }
        }
      } else {
        result = "Order did not post successful";
      }
    }
    if (transactionType == "Sales Invoice") {}

    //Move Stock
  }
}
