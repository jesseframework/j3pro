import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_pricing_rule_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:moor/moor.dart';
import 'package:moor/moor.dart' as moor;

class CalculateDiscount {
  var db;

  String customerGroup;
  String salesTerritory;
  String salesPartner;
  String campaign;
  bool enableHeaderDiscount = false;
  double minPurchase = 0;
  double amountOff = 0;
  DateTime validFrom = DateTime.now();
  DateTime validTo = DateTime.now();
  double accumulatedPurchase = 0;
  String priceOrDiscount;
  double numOfItemOnRegister = 0;
  double numOfItemGroupOnRegister = 0;
  double numOfBrandOnRegister = 0;
  double numOfAllItemsOnRegister = 0;
  double minPurchaseOfItemOnRegister = 0;
  double minPurchaseOfItemGroupOnRegister = 0;
  double minPurchaseOfBrandOnRegister = 0;
  double minPurchaseAllItemsOnRegister = 0;
  double subTotalOnRegisterSum = 0;
  double minCouponSpentOnRegister = 0;
  double numOfcategoryOnRegister = 0;
  double discountAmount = 0;
  double listPrice = 0;
  double lineSubTotal = 0;
  //DAOs
  ItemsDao itemsDao;
  ItemPriceDao itemPriceDao;
  CustomerDao customerDao;
  SalesOrderDetailTempDao salesOrderDetailTempDao;
  ItemPricingRuleDao itemPricingRuleDao;

  CalculateDiscount() {
    db = AppDatabase();
    //DAOs
    itemsDao = new ItemsDao(db);
    itemPriceDao = new ItemPriceDao(db);
    customerDao = new CustomerDao(db);
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
    itemPricingRuleDao = new ItemPricingRuleDao(db);
  }

  Future<void> getDiscount(
      String itemId,
      String uom,
      String customerId,
      String transactionNumber,
      String transactionStatus,
      String itemGroup,
      String itemCode,
      String itemName,
      String category,
      String territory,
      String partner,
      String priceList,
      double unitPrice,
      double quantity,
      String salesUom) async {
    var customer = await customerDao.getAllCustomerById(customerId);
    if (customer != null && customer.length > 0) {
      customerGroup = customer[0].customerGroup;
      salesTerritory = customer[0].customerTerritory;
      //enableHeaderDiscount = customer[0].enableHeaderDiscount;
      salesPartner = "";
      campaign = "";
      minPurchase = customer[0].minQuantity;
      amountOff = customer[0].discountAmount;
      validFrom = customer[0].validFrom;
      validTo = customer[0].validTo;
      accumulatedPurchase = customer[0].accumulatedPurchase;
      //priceOrDiscount = customer[0].;
    }

    salesOrderDetailTempDao
        .qtyOfItemOnRegister(transactionNumber, itemId, uom, transactionStatus)
        .listen((e) {
      numOfItemOnRegister = e.single.quantity;
      minPurchaseOfItemOnRegister = e.single.subTotal;
    });

    salesOrderDetailTempDao
        .qtyOfItemGroupOnRegister(
            transactionNumber, itemGroup, uom, transactionStatus)
        .listen((e) {
      numOfItemGroupOnRegister = e.single.quantity;
      minPurchaseOfItemGroupOnRegister = e.single.subTotal;
    });

    salesOrderDetailTempDao
        .qtyOfBrandOnRegister(
            transactionNumber, category, uom, transactionStatus)
        .listen((e) {
      numOfcategoryOnRegister = e.single.quantity;
      minPurchaseOfBrandOnRegister = e.single.subTotal;
    });

    bool isActive = true;

    itemPricingRuleDao
        .getAllDiscount(
            itemCode,
            itemGroup,
            itemName,
            category,
            customerGroup,
            customerId,
            territory,
            partner,
            priceList,
            validFrom,
            validTo,
            isActive,
            numOfItemOnRegister,
            numOfItemGroupOnRegister,
            numOfAllItemsOnRegister,
            numOfcategoryOnRegister)
        .listen((e) {
      amountOff = e.single.discountPercentage;
      priceOrDiscount = e.single.priceOrDiscount;
    });

    if (priceOrDiscount == "Discount Percentage") {
      discountAmount = amountOff / 100 * unitPrice;
      listPrice = unitPrice - amountOff;
      lineSubTotal = quantity * listPrice;
    } else {
      listPrice = unitPrice - amountOff;
      lineSubTotal = quantity * listPrice;
    }

    //Now Update the list price and call recalcualte
    //ToDo Recalculate Tax
    //ToDo Change Item id to string in model
    //ToDo Add line discount amount
    var tempOrder = new SalesOrderDetailTempCompanion(
        listPrice: moor.Value(listPrice), subTotal: moor.Value(lineSubTotal));

    salesOrderDetailTempDao.updateInvoiceTotal(
        tempOrder, transactionNumber, transactionStatus, 1, salesUom);
  }
}
