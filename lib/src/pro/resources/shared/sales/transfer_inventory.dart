import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_items_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/warehouse/inventory_transaction_crud.dart';
import 'package:moor/moor.dart' as moor;

class TransferInventory {
  var db;
  InventoryTransactionDao inventoryTransactionDao;
  TransferInventory() {
    db = AppDatabase();
    inventoryTransactionDao = new InventoryTransactionDao(db);
  }

  Future<void> transferStock(
    int tenantId,
    String itemCode,
    String itemName,
    int itemId,
    String description,
    String itemGroup,
    String stockUOM,
    String transactionNumber,
    double qtyMove,
    double conversionFactor,
    double itemPrice,
    String transactionType,
    String reasonCode,
  ) async {
    var moveInventory = new InventoryTransactionCompanion(
        tenantId: moor.Value(tenantId),
        itemCode: moor.Value(itemCode),
        itemName: moor.Value(itemName),
        itemId: moor.Value(itemId.toString()), //ToDo Change Model to int
        description: moor.Value(description),
        itemGroup: moor.Value(itemGroup),
        stockUom: moor.Value(stockUOM),
        transactionNumber: moor.Value(transactionNumber),
        qtyMove: moor.Value(qtyMove),
        qtyMoveConvert: moor.Value(conversionFactor * qtyMove),
        conversionFactor: moor.Value(conversionFactor),
        itemPrice: moor.Value(itemPrice),
        transactionType: moor.Value(transactionType),
        reasonCode: moor.Value(reasonCode));

    await inventoryTransactionDao.insertInventoryItems(moveInventory);

    
  }
}
