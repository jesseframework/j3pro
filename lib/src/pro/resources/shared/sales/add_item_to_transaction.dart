import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/preference_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_pricing_rule_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:j3enterprise/src/pro/resources/repositories/items/items_master_repositories.dart';
import 'package:j3enterprise/src/pro/resources/shared/warehouse/add_item_to_warehouse.dart';
import 'package:j3enterprise/src/pro/resources/shared/warehouse/check_inventory.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart' as moor;

class AddItemToTransaction {
  double quantity;
  String result;
  int itemId;
  String itemName;
  String itemCode;
  String itemDescription;
  String itemGroup;
  String category;
  String upcCode;
  String stockUOM;
  String uom;
  String defaultWarehouse;
  String inventoryCycleNumber;
  String transactionNumber;
  String priceList;
  String standardPriceList;
  String customer;
  double itemPrice;
  double sellingDeposit;
  double deposit;
  double returnPrice;
  double returnDeposit;

  //Get Discount
  String customerGroup;
  String territory;
  String partner;
  DateTime validFrom;
  DateTime validTo;
  bool enableHeaderDiscount;
  double minCustPurchase;
  double maxCustPurchase;
  double amountOff;
  double percentageOff;
  double accumalatedPurchase;

  String className = "Add Item To Transaction";
  var db;
  static final _log = Logger('AddItemToTransaction');

  //DAOs
  ItemsDao itemsDao;
  ItemPriceDao itemPriceDao;
  ItemPricingRuleDao itemPricingRuleDao;
  BusinessRuleDao businessRuleDao;
  PreferenceDao preferenceDao;
  ItemMasterRepository itemMasterRepository;
  InventoryItemsDao inventoryItemsDao;
  TempNumberLogsDao tempNumberLogsDao;
  CustomerDao customerDao;
  SalesOrderDetailTempDao salesOrderDetailTempDao;

  //Regular Class
  AddItemToWarehouse addItemToWarehouse;
  CheckInventory checkInventory;

  AddItemToTransaction() {
    db = AppDatabase();
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
    checkInventory = new CheckInventory();
    itemMasterRepository = new ItemMasterRepository();

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
      int userId) async {
    //Get Quantity from POS. If quantity is set used set quantity if quantity is not set assign 1 to quantity

    _log.finest("$className setting quantity");
    if (qtySet == 0) {
      quantity = 1;
    } else {
      quantity = qtySet;
    }

    var item = await itemsDao.getItemForSales(searchText);
    if (item != null && item.length > 0) {
      result = "Item Found";
      //Assign Item values
      itemId = item[0].id;
      itemName = item[0].itemName;
      itemCode = item[0].itemCode;
      itemDescription = item[0].description;
      itemGroup = item[0].itemGroup;
      category = item[0].category;
      stockUOM = "";
      defaultWarehouse = "";
      upcCode = "";
      uom = "";
      priceList = "";
      standardPriceList = "Standard Price List";
      DateTime retiredDate = item[0].retiredDate;

      if (item[0].isRetired == true) {
        result =
            "$itemName is Retired and can not be sold. RIP date $retiredDate";
        //ToDo Validate return state code should exit when this code execute
        return result;
      }

      if (item[0].trackInventory == true) {
        var trackInventory =
            await inventoryItemsDao.getAllInventoryByCode(itemCode);
        if (trackInventory != null && trackInventory.length > 0) {
          var addInvItem = await addItemToWarehouse.addItemToWarehouse(itemCode,
              itemName, stockUOM, defaultWarehouse, inventoryCycleNumber);
          if (addInvItem == "Success") {
            result =
                "Item is now added to your warehouse. Please try selling item againg";
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
      var price = await itemPriceDao.getItemPricesByCode(
          itemCode, uom, priceList, standardPriceList);
      if (price != null && price.length > 0) {
        if (price != null && price.length == 1) {
          priceList = price[0].priceList;
          itemPrice = price[0].itemPrice;
          sellingDeposit = price[0].sellingDeposit;
          deposit = price[0].deposit;
          returnPrice = price[0].returnPrice;
          returnDeposit = price[0].returnDeposit;
        }
        if (price != null && price.length > 0) {
          priceList = price[0].priceList;
          itemPrice = price[0].itemPrice;
          sellingDeposit = price[0].sellingDeposit;
          deposit = price[0].deposit;
          returnPrice = price[0].returnPrice;
          returnDeposit = price[0].returnDeposit;
        }
      } else {
        result =
            '$itemDescription not in pricing schedule assign to selected customer';
        return result;
      }

      //Get Customer infomation
      var cust = await customerDao.getAllCustomerById(customer);
      if (cust != null) {
        customerGroup = cust[0].customerGroup;
        territory = cust[0].customerTerritory;
        partner = "";
        validFrom = cust[0].validFrom;
        validTo = cust[0].validTo;
        enableHeaderDiscount = false;
        accumalatedPurchase = cust[0].accumulatedPurchase;
        percentageOff = cust[0].discountPercentage;
        amountOff = cust[0].discountAmount;
      }

      //Get shopping cart infomation
      var numOfItemOnRegister = salesOrderDetailTempDao.qtyOfItemOnRegister(
          tempSalesOrderNo, itemId, uom, tempTransactionStatus);

      var discount = itemPricingRuleDao.getAllDiscount(
          itemCode,
          itemGroup,
          itemName,
          category,
          customerGroup,
          customer,
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

      //Add New Line
      var newLine = new SalesOrderDetailTempCompanion(
          transactionNumber: moor.Value(tempSalesOrderNo),
          inventoryCycleNumber: moor.Value(tempInventoryCycle),
          daySessionNumber: moor.Value(tempDaySessionNumber),
          deliveryDate: moor.Value(deliveryDate),
          currency: moor.Value(currency),
          exchangeRate: moor.Value(exchangeRate),
          tenantId: moor.Value(tenantId),
          userId: moor.Value(userId),
          userName: moor.Value(currency),
          itemCode: moor.Value(itemCode),
          itemGroup: moor.Value(itemGroup),
          itemId: moor.Value(itemId),
          description: moor.Value(itemDescription),
          unitPrice: moor.Value(itemPrice),
          listPrice: moor.Value(0),
          subTotal: moor.Value(0),
          taxTotal: moor.Value(0));
    } else {
      var searchServer = await businessRuleDao.getSingleBusinessRule("SRCR");
      if (searchServer != null && searchServer.value.contains("Yes")) {
        await itemMasterRepository.getItemMasterFromServer("Items");
        searchText = null;
        qtySet = 0;
      } else {
        result =
            "Invalid Item or Item was not added to your inventory. Please contact your manager";
      }
    }

    return result;
  }
}
