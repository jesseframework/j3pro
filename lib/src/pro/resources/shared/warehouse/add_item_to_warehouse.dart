import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;

class AddItemToWarehouse {
  var db;
  static final _log = Logger('AddItemToWarehouse');
  late String className = "Add Item To Warehouse";
  late String result;

  late InventoryItemsDao inventoryItemsDao;

  AddItemToWarehouse() {
    db = MyDatabase();
    _log.finest("$className constructer call");
    inventoryItemsDao = new InventoryItemsDao(db);
  }

  Future<String> addItemToWarehouse(String itemCode, String itemName, String uom, String defaultWarehouse, String inventoryCycleNumber) async {
    var data = new InventoryItemsCompanion(
        itemCode: moor.Value(itemCode),
        itemName: moor.Value(itemName),
        uom: moor.Value(uom),
        defaultWarehouse: moor.Value(defaultWarehouse),
        quantityOnHand: moor.Value(0),
        quantityAdjust: moor.Value(0),
        quantityCount: moor.Value(0),
        quantitySoldOnInvoice: moor.Value(0),
        inventoryCycleNumber: moor.Value(inventoryCycleNumber));

    await inventoryItemsDao.createOrUpdateInventoryItems(data);
    result = "Success";

    return result;
  }
}
