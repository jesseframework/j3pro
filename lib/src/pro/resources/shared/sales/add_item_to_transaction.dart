import 'package:intl/intl.dart';
import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/preference_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_pricing_rule_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/calculate_discount.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/calculate_tax.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/calculate_total.dart';
import 'package:j3enterprise/src/pro/resources/shared/sales/transfer_inventory.dart';
import 'package:j3enterprise/src/pro/resources/shared/warehouse/add_item_to_warehouse.dart';
import 'package:j3enterprise/src/pro/resources/shared/warehouse/check_inventory.dart';
import 'package:j3enterprise/src/resources/shared/utils/date_formating.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;

class AddItemToTransaction {
  late double quantity;
  late String result;
  late String itemId;
  late String itemName;
  late String itemCode;
  late String itemDescription;
  late String itemGroup;
  late String category;
  late String upcCode;
  late String stockUOM;
  late String uom;
  late String defaultWarehouse;
  // String inventoryCycleNumber;
  // String transactionNumber;
  // String transactionStatus;
  late String priceList;
  late String standardPriceList;

  late double itemPrice;
  late double sellingDeposit;
  late double deposit;
  late double returnPrice;
  late double returnDeposit;
  late double lineSubTotal;
  late String taxGroup;
  late double conversionFactor;
  late DateTime salesDate;

  //Get Discount
  late String customerGroup;
  late String territory;
  late String partner;
  late DateTime validFrom;
  late DateTime validTo;
  late bool enableHeaderDiscount;
  late double minCustPurchase;
  late double maxCustPurchase;
  late double amountOff;
  late double percentageOff;
  late double accumalatedPurchase;
  late double listPrice;
  late double registerQuantityTotal;

  late String className = "Add Item To Transaction";
  var db;
  static final _log = Logger('AddItemToTransaction');

  //DAOs
  late ItemsDao itemsDao;
  late ItemPriceDao itemPriceDao;
  late ItemPricingRuleDao itemPricingRuleDao;
  late BusinessRuleDao businessRuleDao;
  late PreferenceDao preferenceDao;
  //ItemMasterRepository itemMasterRepository;
  late InventoryItemsDao inventoryItemsDao;
  late TempNumberLogsDao tempNumberLogsDao;
  late CustomerDao customerDao;
  late SalesOrderDetailTempDao salesOrderDetailTempDao;
  late SystemCurrencyDao systemCurrencyDao;

  //Regular Class
  late AddItemToWarehouse addItemToWarehouse;
  late CheckInventory checkInventory;
  late CalculateDiscount calculateDiscount;
  late CalculateTax calculateTax;
  late CalculateTotal calculateTotal;
  late TransferInventory transferInventory;

  AddItemToTransaction() {
    db = MyDatabase();
    _log.finest("$className repository constructer call");

    //DAOs in Constructure
    itemsDao = new ItemsDao(db);
    itemPriceDao = new ItemPriceDao(db);
    itemPricingRuleDao = new ItemPricingRuleDao(db);
    businessRuleDao = new BusinessRuleDao(db);
    preferenceDao = new PreferenceDao(db);
    inventoryItemsDao = new InventoryItemsDao(db);
    tempNumberLogsDao = new TempNumberLogsDao(db);
    salesOrderDetailTempDao = new SalesOrderDetailTempDao(db);
    customerDao = new CustomerDao(db);
    systemCurrencyDao = new SystemCurrencyDao(db);
    checkInventory = new CheckInventory();
    calculateDiscount = new CalculateDiscount();
    calculateTax = new CalculateTax();
    calculateTotal = new CalculateTotal();
    //itemMasterRepository = new ItemMasterRepository();

    //Regular Class
    addItemToWarehouse = new AddItemToWarehouse();
  }

  Future<String> getItem(
      double qtySet,
      String searchText,
      String tempSalesOrderNo,
      String tempTransactionStatus,
      String tempInventoryCycle,
      String tempDaySessionNumber,
      DateTime deliveryDate,
      String currency,
      double exchangeRate,
      int tenantId,
      String userName,
      int userId,
      String customerId) async {
    //Get Quantity from POS. If quantity is set used set quantity if quantity is not set assign 1 to quantity

    _log.finest("$className setting quantity");
    if (qtySet == 0) {
      quantity = 1;
    } else {
      quantity = qtySet;
    }

    var item = await itemsDao.getItemForSales(searchText);
    if (item.length > 0) {
      //Assign Item values
      itemId = item[0].itemId;
      itemName = item[0].itemName!;
      itemCode = item[0].itemCode!;
      itemDescription = item[0].description!;
      itemGroup = item[0].itemGroup!;
      category = item[0].category!;
      stockUOM = "";
      defaultWarehouse = item[0].defaultWarehouse!;
      upcCode = "";
      String formatted = await formatDate(DateTime.now().toString());
      salesDate = DateTime.tryParse(formatted)!;
      uom = item[0].uom!;
      //taxIndicator = item[0].tax
      priceList = "";
      standardPriceList = "Standard Selling";
      DateTime retiredDate = item[0].retiredDate!;

      var getCusTaxGroup = await customerDao.getAllCustomerById(customerId);
      if (getCusTaxGroup.length > 0) {
        taxGroup = getCusTaxGroup[0].taxGroup!;
      } else {
        taxGroup = item[0].taxGroup!;
      }

      if (item[0].isRetired == true) {
        result = "$itemName is Retired and can not be sold. RIP date $retiredDate";
        //ToDo Validate return state code should exit when this code execute
        return result;
      }

      if (item[0].trackInventory == true) {
        var trackInventory = await inventoryItemsDao.getAllInventoryByCode(itemCode);
        if (trackInventory != null && trackInventory.length > 0) {
          var addInvItem = await addItemToWarehouse.addItemToWarehouse(itemCode, itemName, stockUOM, defaultWarehouse, tempInventoryCycle);
          if (addInvItem == "Success") {
            result = "Item is now added to your warehouse. Please try selling item againg";
          } else {
            result = "Item was not addess to your warehouse. Please try againg";
          }

          return result;
        }

        var isInStock = await checkInventory.checkInventoey(itemCode);
        if (isInStock <= 0) {
          return result = "Item Out of Stock and cant be sold";
        }
      }

      //Get Price
      var price = await itemPriceDao.getItemPricesByCode(itemId, uom, priceList, standardPriceList);

      if (price != null && price.length > 0 && price.length == 1) {
        priceList = price[0].priceList!;
        itemPrice = price[0].itemPrice;
        sellingDeposit = price[0].sellingDeposit;
        deposit = price[0].deposit;
        returnPrice = price[0].returnPrice;
        returnDeposit = price[0].returnDeposit;
        conversionFactor = price[0].conversionFactor;
      } else {
        result = '$itemDescription not in pricing schedule assign to selected customer';
        return result;
      }

      //Update Quantity on Line Item
      var onRegister = await salesOrderDetailTempDao.getAllSalesOrderForUpdate(tempSalesOrderNo, tempTransactionStatus, itemId, uom);
      if (onRegister.length > 0 && onRegister != null) {
        registerQuantityTotal = onRegister.single.quantity;

        double formatedSubTotal = 0;
        double unformatedSubTotal = (quantity + onRegister.single.quantity) * itemPrice;

        var currency = await systemCurrencyDao.getAllSystemCurrencyByName("JMD");
        if (currency.length > 0) {
          var f = new NumberFormat(currency[0].numberFormat, "en_US");
          formatedSubTotal = double.tryParse(f.format(unformatedSubTotal))!;
        } else {
          var f = new NumberFormat("###.0#", "en_US");
          formatedSubTotal = double.tryParse(f.format(unformatedSubTotal))!;
        }

        var lineUpdate = new SalesOrderDetailTempCompanion(
          quantity: moor.Value(quantity + onRegister.single.quantity),
          shippingTotal: moor.Value(0),
          listPrice: moor.Value(itemPrice),
          subTotal: moor.Value(formatedSubTotal),
        );
        await salesOrderDetailTempDao.updateLineItem(lineUpdate, tempSalesOrderNo, tempTransactionStatus, itemId, uom);

        //Check for discount
        await calculateDiscount.getDiscount(itemId, uom, customerId, tempSalesOrderNo, tempTransactionStatus, itemGroup, itemCode, itemName, category,
            territory, partner, priceList, itemPrice, quantity + registerQuantityTotal, uom);

        //Calculate Tax
        await calculateTax.getTotalTax(searchText, tempSalesOrderNo, tempTransactionStatus, uom, tenantId, userName, userId, itemId, customerId,
            taxGroup, salesDate, (quantity + onRegister.single.quantity) * itemPrice);
      } else {
        //Add New Line
        //Line SubTotal Calculation
        //ToDo Calculate return price, return deposit, deposit and selling deposit
        lineSubTotal = itemPrice * quantity;
        var newLine = new SalesOrderDetailTempCompanion(
            transactionNumber: moor.Value(tempSalesOrderNo),
            inventoryCycleNumber: moor.Value(tempInventoryCycle),
            daySessionNumber: moor.Value(tempDaySessionNumber),
            deliveryDate: moor.Value(deliveryDate),
            currency: moor.Value(currency),
            exchangeRate: moor.Value(exchangeRate),
            tenantId: moor.Value(tenantId),
            userId: moor.Value(userId),
            userName: moor.Value(userName),
            itemCode: moor.Value(itemCode),
            itemGroup: moor.Value(itemGroup),
            itemId: moor.Value(itemId),
            description: moor.Value(itemDescription),
            quantity: moor.Value(quantity),
            shippingTotal: moor.Value(0),
            unitPrice: moor.Value(itemPrice),
            listPrice: moor.Value(itemPrice),
            costPrice: moor.Value(0),
            conversionFactor: moor.Value(conversionFactor),
            discountAmount: moor.Value(0),
            lineDiscountTotal: moor.Value(0),
            subTotal: moor.Value(lineSubTotal),
            grandTotal: moor.Value(0),
            itemCount: moor.Value(0),
            depositTotal: moor.Value(0),
            lineId: moor.Value(0),
            taxTotal: moor.Value(0),
            upcCode: moor.Value(upcCode),
            salesUOM: moor.Value(uom),
            warehouse: moor.Value(defaultWarehouse),
            transactionStatus: moor.Value(tempTransactionStatus),
            category: moor.Value(category));

        await salesOrderDetailTempDao.insertSalesOrderDetail(newLine);

        //Check for discount
        await calculateDiscount.getDiscount(itemId, uom, customerId, tempSalesOrderNo, tempTransactionStatus, itemGroup, itemCode, itemName, category,
            territory, partner, priceList, itemPrice, quantity, uom);

        //Calculate Tax
        if (taxGroup != null) {
          await calculateTax.getTotalTax(searchText, tempSalesOrderNo, tempTransactionStatus, uom, tenantId, userName, userId, itemId, customerId,
              taxGroup, salesDate, lineSubTotal);
        }
      }

      await calculateTotal.getTotal(tempSalesOrderNo, tempTransactionStatus, itemId, uom);

      // transferInventory.transferStock(
      //     tenantId,
      //     itemCode,
      //     itemName,
      //     itemId,
      //     description,
      //     itemGroup,
      //     stockUOM,
      //     transactionNumber,
      //     qtyMove,
      //     conversionFactor,
      //     itemPrice,
      //     'Order',
      //     'Standard Order');

      //Clean up transaction for next item
      registerQuantityTotal = 0;
      quantity = 0;

      //ToDo Check if code execute successfull
    } else {
      var searchServer = await businessRuleDao.getSingleBusinessRule("SRCR");
      if (searchServer != null && searchServer.value.contains("Yes")) {
        //await itemMasterRepository.getItemMasterFromServer("Items");
        searchText = "";
        qtySet = 0;
      } else {
        result = "Invalid Item or Item was not added to your inventory. Please contact your manager";
      }
    }

    return result;
  }
}
