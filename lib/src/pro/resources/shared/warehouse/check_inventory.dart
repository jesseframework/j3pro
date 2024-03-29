import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;

class CheckInventory {
  var db;
  static final _log = Logger('CheckInventory');
  late String className = "Check Inventory";

  late InventoryItemsDao inventoryItemsDao;

  CheckInventory() {
    db = MyDatabase();
    _log.finest("$className constructer call");
    inventoryItemsDao = new InventoryItemsDao(db);
  }

  Future<double> checkInventoey(String itemCode) async {
    var isInStock = await inventoryItemsDao.getSingleInventoryByCode(itemCode);
    return isInStock.quantityOnHand;
  }

  //ToDo Add check inventory
}
