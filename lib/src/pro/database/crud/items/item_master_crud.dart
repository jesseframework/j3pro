import 'package:j3enterprise/src/database/moor_database.dart';
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

  //AddItem and Pricing Logic
  Future<List<Item>> getItemForSales(String searchText) {
    return (select(db.items)
          ..where((t) =>
              t.itemCode.equals(searchText) |
              t.itemName.equals(searchText) |
              t.itemCode.equals(searchText) |
              t.description.equals(searchText)))
        .get();
  }
}
