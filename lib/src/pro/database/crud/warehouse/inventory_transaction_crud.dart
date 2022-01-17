import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/warehouse/inventory_transaction_model.dart';
import 'package:drift/drift.dart';

part 'inventory_transaction_crud.g.dart';

@DriftAccessor(tables: [InventoryTransaction])
class InventoryTransactionDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryTransactionDaoMixin {
  final AppDatabase db;
  InventoryTransactionDao(this.db) : super(db);

  Future<List<InventoryTransactionData>> getAllInventoryItem() {
    return (select(db.inventoryTransaction).get());
  }

  Stream<List<InventoryTransactionData>> watchAllInventoryItemByCode(
      String itemCode) {
    return (select(db.inventoryTransaction)
          ..where((t) => t.itemCode.equals(itemCode)))
        .watch();
  }

  Future<List<InventoryTransactionData>> getAllInventoryByCode(
      String itemCode) {
    return (select(db.inventoryTransaction)
          ..where((t) => t.itemCode.equals(itemCode)))
        .get();
  }

  Future<InventoryTransactionData> getSingleInventoryByCode(String itemCode) {
    return (select(db.inventoryTransaction)
          ..where((t) => t.itemCode.equals(itemCode)))
        .getSingle();
  }

  Future<void> createOrUpdateInventoryItems(
      InventoryTransactionCompanion inventoryItem) {
    return into(db.inventoryTransaction).insertOnConflictUpdate(inventoryItem);
  }

  Future<void> insertInventoryItems(
      InventoryTransactionCompanion inventoryItem) {
    return into(db.inventoryTransaction).insert(inventoryItem);
  }

  Future deleteAllItem() => delete(db.inventoryTransaction).go();
}
