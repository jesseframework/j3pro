import 'package:j3enterprise/src/database/moor_database.dart';
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
import 'package:moor/moor.dart' as moor;

class PostTransaction {
  //Other

  String result;
  var db;
  var salesDetailData;
  NumberGenerator numberGenerator;
  TransferInventory transferInventory;

  //Dto
  SalesOrderDetailTempDao salesOrderDetailTempDao;
  SalesOrderDetailDao salesOrderDetailDao;
  SalesOrderHeaderDao salesOrderHeaderDao;
  InventoryItemsDao inventoryItemsDao;
  CustomerDao customerDao;
  ContactDao contactDao;
  AddressDao addressDao;
  SeriesNumberGeneratorDao seriesNumberGeneratorDao;
  TempNumberLogsDao tempNumberLogsDao;

  PostTransaction() {
    db = AppDatabase();
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
      String customerId,
      String transactionType,
      String transactionNumber,
      String transactionStatus,
      String inventoryCycleNumber,
      String daySessionNumber,
      String orderType) async {
    if (transactionType == "Sales Order") {
      //Sales Order Header
      var getCustomer = await customerDao.getAllCustomerById(customerId);
      if (getCustomer.length > 0 && getCustomer != null) {}

      var salesDetail = await salesOrderDetailTempDao
          .getAllSalesOrderDetailTemp(transactionNumber, transactionStatus);
      for (var detail in salesDetail) {
        salesDetailData = new SalesOrderDetailCompanion(
            userName: moor.Value(detail.userName),
            userId: moor.Value(detail.userId),
            transactionNumber: moor.Value(detail.transactionNumber),
            transactionStatus: moor.Value("Post"),
            inventoryCycleNumber: moor.Value(detail.inventoryCycleNumber),
            daySessionNumber: moor.Value(detail.daySessionNumber),
            deliveryDate: moor.Value(detail.deliveryDate),
            currency: moor.Value(detail.currency),
            exchangeRate: moor.Value(detail.exchangeRate),
            itemId: moor.Value(detail.itemId),
            itemCode: moor.Value(detail.itemCode),
            upcCode: moor.Value(detail.upcCode),
            description: moor.Value(detail.description),
            itemGroup: moor.Value(detail.itemGroup),
            category: moor.Value(detail.category),
            salesUOM: moor.Value(detail.salesUOM),
            stockUOM: moor.Value(detail.stockUOM),
            taxGroup: moor.Value(detail.taxGroup),
            warehouse: moor.Value(detail.warehouse),
            discountType: moor.Value(detail.discountType),
            discountPercentage: moor.Value(detail.discountPercentage),
            discountAmount: moor.Value(detail.discountAmount),
            lineDiscountTotal: moor.Value(detail.lineDiscountTotal),
            unitPrice: moor.Value(detail.unitPrice),
            costPrice: moor.Value(detail.costPrice),
            listPrice: moor.Value(detail.listPrice),
            quantity: moor.Value(detail.quantity),
            subTotal: moor.Value(detail.subTotal),
            grandTotal: moor.Value(detail.grandTotal),
            taxTotal: moor.Value(detail.taxTotal),
            shippingTotal: moor.Value(detail.shippingTotal),
            conversionFactor: moor.Value(detail.conversionFactor));
      }

      var salesHeader = new SalesOrderHeaderCompanion(
          transactionNumber: moor.Value(transactionNumber),
          transactionStatus: moor.Value("Post"),
          inventoryCycleNumber: moor.Value(inventoryCycleNumber),
          daySessionNumber: moor.Value(daySessionNumber),
          customerId: moor.Value(0), //ToDo convert to string
          soldTo: moor.Value(""),
          orderDate: moor.Value(DateTime.now()),
          deliveryDate:
              moor.Value(DateTime.now()), //ToDo Add correct deliver date
          orderType: moor.Value(orderType),
          orderStatus: moor.Value("Waiting"),
          purchaseOrderNo: moor.Value(""), //ToDo Bring in PO No
          currency: moor.Value(""),
          exchangeRate: moor.Value(0),
          tenantId: moor.Value(0),
          couponCode: moor.Value(0),
          billingAddressName: moor.Value(""),
          shippingAddressName: moor.Value(""),
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
          userName: moor.Value(""),
          userId: moor.Value(0),
          latitude: moor.Value(0),
          longitude: moor.Value(0),
          transactionStart: moor.Value(DateTime.now()),
          transactionEnd: moor.Value(DateTime.now()));

      var isPost = await salesOrderDetailDao.postSalesOrderData(
          salesDetailData, salesHeader);

      if (isPost == true) {
        var lastInvoice = await salesOrderHeaderDao.getAllSalesOrderHeader();
        if (lastInvoice.length > 0 && lastInvoice != null) {
          var sn = await seriesNumberGeneratorDao
              .getAllSeriesNumberByType(transactionType);
          if (sn.length > 0 && sn != null) {
            await numberGenerator.getSerialNumber(
                transactionType, lastInvoice.length, sn.single.endingLength);

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
          var sn = await seriesNumberGeneratorDao
              .getAllSeriesNumberByType(transactionType);
          if (sn.length > 0 && sn != null) {
            await numberGenerator.getSerialNumber(
                transactionType, 0, sn.single.endingLength);

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
