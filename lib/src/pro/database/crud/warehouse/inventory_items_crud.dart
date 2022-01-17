import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/warehouse/inventory_items_model.dart';
import 'package:drift/drift.dart';

part 'inventory_items_crud.g.dart';

@DriftAccessor(tables: [InventoryItems])
class InventoryItemsDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryItemsDaoMixin {
  final AppDatabase db;
  InventoryItemsDao(this.db) : super(db);

  Future<List<InventoryItem>> getAllInventoryItem() {
    return (select(db.inventoryItems).get());
  }

  Stream<List<InventoryItem>> watchAllInventoryItemByCode(String itemCode) {
    return (select(db.inventoryItems)
          ..where((t) => t.itemCode.equals(itemCode)))
        .watch();
  }

  Future<List<InventoryItem>> getAllInventoryByCode(String itemCode) {
    return (select(db.inventoryItems)
          ..where((t) => t.itemCode.equals(itemCode)))
        .get();
  }

  Future<InventoryItem> getSingleInventoryByCode(String itemCode) {
    return (select(db.inventoryItems)
          ..where((t) => t.itemCode.equals(itemCode)))
        .getSingle();
  }

  Future<void> createOrUpdateInventoryItems(
      InventoryItemsCompanion inventoryItem) {
    return into(db.inventoryItems).insertOnConflictUpdate(inventoryItem);
  }

  Future deleteAllItem() => delete(db.items).go();
}
