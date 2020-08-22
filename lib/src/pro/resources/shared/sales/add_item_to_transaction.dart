import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/preference_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_pricing_rule_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:j3enterprise/src/pro/resources/repositories/items/items_master_repositories.dart';
import 'package:j3enterprise/src/pro/resources/shared/warehouse/add_item_to_warehouse.dart';
import 'package:j3enterprise/src/pro/resources/shared/warehouse/check_inventory.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart' as moor;

class AddItemToTransaction {
  int quantity;
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

  //Regular Class
  AddItemToWarehouse addItemToWarehouse;
  CheckInventory checkInventory;

  AddItemToTransaction() {
    db = AppDatabase();
    _log.finest("$className repository constructer call");

    //DAOs in Constructer
    itemsDao = new ItemsDao(db);
    itemPriceDao = new ItemPriceDao(db);
    itemPricingRuleDao = new ItemPricingRuleDao(db);
    businessRuleDao = new BusinessRuleDao(db);
    preferenceDao = new PreferenceDao(db);
    inventoryItemsDao = new InventoryItemsDao(db);
    checkInventory = new CheckInventory();
    itemMasterRepository = new ItemMasterRepository();

    //Regular Class
    addItemToWarehouse = new AddItemToWarehouse();
  }

  Future<String> getItem(int qtySet, String searchText) async {
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
      //Assign Item valuse
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
      DateTime retiredDate = item[0].retiredDate;

      if (item[0].isRetired == true) {
        result =
            "$itemName is Retired and can not be sold. RIP date $retiredDate";
        //ToDo Valide return statem code should exit when this code execute
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
      var price = await itemPriceDao.getItemPricesByCode(itemCode);
      if (price != null && price.length > 0) {
        
      }
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
