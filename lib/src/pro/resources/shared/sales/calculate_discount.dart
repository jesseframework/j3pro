import 'package:intl/intl.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_pricing_rule_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:drift/drift.dart' as moor;

class CalculateDiscount {
  var db;

  late String customerGroup;
  late String salesTerritory;
  late String salesPartner;
  late String campaign;
  late bool enableHeaderDiscount = false;
  late double minPurchase = 0;
  late double amountOff = 0;
  late DateTime validFrom = DateTime.now();
  late DateTime validTo = DateTime.now();
  late double accumulatedPurchase = 0;
  late String priceOrDiscount;
  late double numOfItemOnRegister = 0;
  late double numOfItemGroupOnRegister = 0;
  late double numOfBrandOnRegister = 0;
  late double numOfAllItemsOnRegister = 0;
  late double minPurchaseOfItemOnRegister = 0;
  late double minPurchaseOfItemGroupOnRegister = 0;
  late double minPurchaseOfBrandOnRegister = 0;
  late double minPurchaseAllItemsOnRegister = 0;
  late double subTotalOnRegisterSum = 0;
  late double minCouponSpentOnRegister = 0;
  late double numOfcategoryOnRegister = 0;
  late double discountAmount = 0;
  late double listPrice = 0;
  late double lineSubTotal = 0;
  //DAOs
  late ItemsDao itemsDao;
  late ItemPriceDao itemPriceDao;
  late CustomerDao customerDao;
  late SalesOrderDetailTempDao salesOrderDetailTempDao;
  late SystemCurrencyDao systemCurrencyDao;
  late ItemPricingRuleDao itemPricingRuleDao;

  CalculateDiscount() {
    db = AppDatabase();
    //DAOs
    itemsDao = new ItemsDao(db);
    itemPriceDao = new ItemPriceDao(db);
    customerDao = new CustomerDao(db);
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
    itemPricingRuleDao = new ItemPricingRuleDao(db);
    systemCurrencyDao = new SystemCurrencyDao(db);
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
      if (e.isNotEmpty) {
        numOfItemOnRegister = e.single.quantity;
        minPurchaseOfItemOnRegister = e.single.subTotal;
      }
    });

    //qty.map((e) => e.single.quantity).listen(print, onError: (e, s) => print('Got error $e at $s'));

    salesOrderDetailTempDao
        .qtyOfItemGroupOnRegister(
            transactionNumber, itemGroup, uom, transactionStatus)
        .listen((e) {
      if (e.isNotEmpty) {
        numOfItemGroupOnRegister = e.single.quantity;
        minPurchaseOfItemGroupOnRegister = e.single.subTotal;
      }
    });

    salesOrderDetailTempDao
        .qtyOfBrandOnRegister(
            transactionNumber, category, uom, transactionStatus)
        .listen((e) {
      if (e.isNotEmpty) {
        numOfcategoryOnRegister = e.single.quantity;
        minPurchaseOfBrandOnRegister = e.single.subTotal;
      }
    });

    bool isActive = true;

    var isDiscount = await itemPricingRuleDao.getAllDiscount(
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
        numOfcategoryOnRegister);

    if (isDiscount.length > 0) {
      double formateddiscountAmount = 0;
      double formatedListPrice = 0;
      double formatedlineSubTotal = 0;

      amountOff = isDiscount.single.discountPercentage;
      priceOrDiscount = isDiscount.single.priceOrDiscount!;

      if (priceOrDiscount == "Percentage") {
        discountAmount = amountOff / 100 * unitPrice;
        listPrice = unitPrice - discountAmount;
        lineSubTotal = quantity * listPrice;
      } else {
        listPrice = unitPrice - amountOff;
        lineSubTotal = quantity * listPrice;
        discountAmount = amountOff;
      }

      var currency = await systemCurrencyDao.getAllSystemCurrencyByName("JMD");
      if (currency.length > 0) {
        var f = new NumberFormat(currency[0].numberFormat, "en_US");
        formateddiscountAmount = double.tryParse(f.format(discountAmount))!;
        var flistprice = new NumberFormat(currency[0].numberFormat, "en_US");
        formatedListPrice = double.tryParse(flistprice.format(listPrice))!;
        var flinetotal = new NumberFormat(currency[0].numberFormat, "en_US");
        formatedlineSubTotal =
            double.tryParse(flinetotal.format(lineSubTotal))!;
      } else {
        var f = new NumberFormat("###.0#", "en_US");
        formateddiscountAmount = double.tryParse(f.format(discountAmount))!;

        var flistprice = new NumberFormat("###.0#", "en_US");
        formatedListPrice = double.tryParse(flistprice.format(listPrice))!;
        var flinetotal = new NumberFormat("###.0#", "en_US");
        formatedlineSubTotal =
            double.tryParse(flinetotal.format(lineSubTotal))!;
      }

      //Now Update the list price and call recalcualte
      //ToDo line discount amount is added however must be able ot recalcuale with other discount apply to the line
      var tempOrder = new SalesOrderDetailTempCompanion(
          listPrice: moor.Value(formatedListPrice),
          subTotal: moor.Value(formatedlineSubTotal),
          discountPercentage: moor.Value(amountOff),
          discountAmount: moor.Value(formateddiscountAmount),
          lineDiscountTotal: moor.Value(formateddiscountAmount),
          discountType: moor.Value(priceOrDiscount));

      await salesOrderDetailTempDao.updateInvoiceTotal(
          tempOrder, transactionNumber, transactionStatus, itemId, salesUom);
    }
  }
}
