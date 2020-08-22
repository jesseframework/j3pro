import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/item_prices_model.dart';
import 'package:moor/moor.dart';

part 'item_price_crud.g.dart';

@UseDao(tables: [ItemPrice])
class ItemPriceDao extends DatabaseAccessor<AppDatabase>
    with _$ItemPriceDaoMixin {
  final AppDatabase db;
  ItemPriceDao(this.db) : super(db);

  Future<List<ItemPriceData>> getAllItemPrice() {
    return (select(db.itemPrice).get());
  }

  Stream<List<ItemPriceData>> watchItemPriceByCode(String itemCode) {
    return (select(db.itemPrice)..where((t) => t.itemCode.equals(itemCode)))
        .watch();
  }

  Future<List<ItemPriceData>> getItemPricesByCode(String itemCode) {
    return (select(db.itemPrice)..where((t) => t.itemCode.equals(itemCode)))
        .get();
  }

  Future<void> createOrUpdateItemPrice(ItemPriceData itemPriceData) {
    return into(db.itemPrice).insertOnConflictUpdate(itemPriceData);
  }

  Future deleteAllItemPrice() => delete(db.itemPrice).go();

  
}
