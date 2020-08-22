import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart' as moor;

class AddItemToWarehouse {
  var db;
  static final _log = Logger('AddItemToWarehouse');
  String className = "Add Item To Warehouse";
  String result;

  InventoryItemsDao inventoryItemsDao;

  AddItemToWarehouse() {
    db = AppDatabase();
    _log.finest("$className constructer call");
    inventoryItemsDao = new InventoryItemsDao(db);
  }

  Future<String> addItemToWarehouse(String itemCode, String itemName,
      String uom, String defaultWarehouse, String inventoryCycleNumber) async {
    var data = new InventoryItemsCompanion(
        itemCode: moor.Value(itemCode),
        itemName: moor.Value(itemName),
        uom: moor.Value(uom),
        defaultWarehouse: moor.Value(defaultWarehouse),
        qtyOnHand: moor.Value(0),
        qtyAdjust: moor.Value(0),
        qtyCount: moor.Value(0),
        qtySold: moor.Value(0),
        inventoryCycleNumber: moor.Value(inventoryCycleNumber));

    await inventoryItemsDao.createOrUpdateInventoryItems(data);
    result = "Success";

    return result;
  }
}
