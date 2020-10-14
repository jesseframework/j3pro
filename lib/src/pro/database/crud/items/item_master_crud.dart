import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/ItemsWithPrices.dart';
import 'package:j3enterprise/src/pro/models/items/item_master_model.dart';
import 'package:moor/moor.dart';

part 'item_master_crud.g.dart';

@UseDao(tables: [Items])
class ItemsDao extends DatabaseAccessor<AppDatabase> with _$ItemsDaoMixin {
  final AppDatabase db;
  ItemsDao(this.db) : super(db);

  Future<List<Item>> getAllItem() {
    return (select(db.items).get());
  }

  Stream<List<Item>> watchAllItemByCode(String itemCode) {
    return (select(db.items)..where((t) => t.itemCode.equals(itemCode)))
        .watch();
  }

  Future<List<Item>> getAllItemByCode(String itemCode) {
    return (select(db.items)..where((t) => t.itemCode.equals(itemCode))).get();
  }

  Future<void> createOrUpdateItems(Item items) {
    return into(db.items).insertOnConflictUpdate(items);
  }

  Future deleteAllItem() => delete(db.items).go();

  Stream<List<Item>> itemSearch(String searchText) {
    return (select(db.items)
          ..where((t) =>
              t.itemCode.contains(searchText) |
              t.itemName.contains(searchText) |
              t.description.contains(searchText)))
        .watch();
  }

  //AddItem and Pricing Logic
  Future<List<Item>> getItemForSales(String searchText) {
    return (select(db.items)
          ..where((t) =>
              t.itemCode.equals(searchText) |
              t.itemName.equals(searchText) |
              t.description.equals(searchText)))
        .get();
  }

  Stream<List<ItemsWithPrices>> watchItemsWithPricesJoin(
      String searchText, bool isDelete) {
    final query = select(db.items).join([
      leftOuterJoin(db.itemPrice, db.items.id.equalsExp(db.itemPrice.itemId)),
    ])
      ..where(db.items.itemName.contains(searchText) |
          db.items.itemCode.contains(searchText) |
          db.items.description.contains(searchText) &
              db.items.isDeleted.equals(isDelete));
    return query.watch().map((rows) {
      return rows.map((row) {
        return ItemsWithPrices(
            row.readTable(db.items), row.readTable(db.itemPrice));
      }).toList();
    });
  }
}
