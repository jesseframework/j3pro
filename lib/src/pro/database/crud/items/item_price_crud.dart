import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/items/item_prices_model.dart';
import 'package:drift/drift.dart';

part 'item_price_crud.g.dart';

@DriftAccessor(tables: [ItemsPrices])
class ItemPriceDao extends DatabaseAccessor<MyDatabase> with _$ItemPriceDaoMixin {
  final MyDatabase db;
  ItemPriceDao(this.db) : super(db);

  Future<List<ItemsPrice>> getAllItemPrice() {
    return (select(db.itemsPrices).get());
  }

  Stream<List<ItemsPrice>> watchItemPriceByCode(String itemCode) {
    return (select(db.itemsPrices)..where((t) => t.itemCode.equals(itemCode))).watch();
  }

  Future<List<ItemsPrice>> getItemPricesByCode(String itemId, String uom, String priceList, String standardPriceList) {
    return (select(db.itemsPrices)
          ..where((t) => t.itemId.equals(itemId) & t.uom.contains(uom) & (t.priceList.contains(priceList) | t.priceList.equals(standardPriceList))))
        .get();
  }

  Future<void> createOrUpdateItemPrice(ItemsPrice itemPriceData) {
    return into(db.itemsPrices).insertOnConflictUpdate(itemPriceData);
  }

  Future deleteAllItemPrice() => delete(db.itemsPrices).go();
}
