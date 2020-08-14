import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/item_pricing_rule_model.dart';
import 'package:moor/moor.dart';

part 'item_pricing_rule_crud.g.dart';

@UseDao(tables: [ItemPricingRule])
class ItemPricingRuleDao extends DatabaseAccessor<AppDatabase>
    with _$ItemPricingRuleDaoMixin {
  final AppDatabase db;
  ItemPricingRuleDao(this.db) : super(db);

  Future<List<ItemPricingRuleData>> getAllItemPricingRuleData() {
    return (select(db.itemPricingRule).get());
  }

  Stream<List<ItemPricingRuleData>> watchAllItemPricingRuleByCode(
      String itemCode) {
    return (select(db.itemPricingRule)
          ..where((t) => t.itemCode.equals(itemCode)))
        .watch();
  }

  Future<List<ItemPricingRuleData>> getAllItemPricingRuleByCode(
      String itemCode) {
    return (select(db.itemPricingRule)
          ..where((t) => t.itemCode.equals(itemCode)))
        .get();
  }

  Future<void> createOrUpdateItems(ItemPricingRuleData itemPriceData) {
    return into(db.itemPricingRule).insertOnConflictUpdate(itemPriceData);
  }

  Future deleteAllItemPricingRule() => delete(db.itemPricingRule).go();
}
