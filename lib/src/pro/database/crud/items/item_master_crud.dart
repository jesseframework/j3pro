import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/ItemsWithPrices.dart';
import 'package:j3enterprise/src/pro/models/items/item_master_model.dart';
import 'package:j3enterprise/src/pro/models/items/item_prices_model.dart';
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

//ToDo can be remove using
  Stream<List<ItemsWithPrices>> watchItemsWithPricesJoin(String searchText) {
    final query = select(db.items).join([
      leftOuterJoin(
          db.itemsPrices, db.items.id.equalsExp(db.itemsPrices.itemId)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return ItemsWithPrices(
            row.readTable(db.items), row.readTable(db.itemsPrices));
      }).toList();
    });
  }

  Stream<List<ItemsWithPrices>> watchitemsWithprices(
      String searchText) {
    return customSelect(
        ' SELECT '
        ' i.item_name, '
        ' i.item_code, '
        ' i.description, '
        ' i.item_group, '
        ' i.category, '
        ' i.uom, '
        ' p.item_price '
        ' FROM items i '
        ' LEFT OUTER JOIN items_prices p on i.id = p.item_id '
        ' WHERE '
        ' i.item_code LIKE ? or '
        ' i.item_name LIKE ? or '
        ' i.description LIKE ? or '
        ' i.item_group LIKE ? or '
        ' i.category LIKE ? or '
        ' i.uom LIKE ? and '
        ' i.is_deleted = 0; ',
        readsFrom: {
          db.items,
          db.itemsPrices
        },
        variables: [
          Variable.withString(searchText),
          Variable.withString(searchText),
          Variable.withString(searchText),
          Variable.withString(searchText),
          Variable.withString(searchText),
          Variable.withString(searchText)
        ]).watch().map((rows) {
      return rows
          .map((e) => ItemsWithPrices(
              Item.fromData(e.data, db), ItemsPrice.fromData(e.data, db)))
          .toList();
    });
  }
}
