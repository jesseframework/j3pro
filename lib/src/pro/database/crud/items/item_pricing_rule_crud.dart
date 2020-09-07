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

  Future<void> createOrUpdateItemPricingRule(
      ItemPricingRuleData itemPriceData) {
    return into(db.itemPricingRule).insertOnConflictUpdate(itemPriceData);
  }

  Future deleteAllItemPricingRule() => delete(db.itemPricingRule).go();

  //This section is used for discount calculation
  Stream<List<ItemPricingRuleData>> qtyOfAllItemsOnRegister(
      String itemCode,
      String itemGroup,
      String itemName,
      String category,
      String customerGroup,
      String customer,
      String territory,
      String partner,
      String priceList,
      DateTime validFrom,
      DateTime validTo,
      bool isActive,
      double numOfItemOnRegister,
      double numOfItemGroupOnRegister,
      double numOfAllItemsOnRegister,
      double numOfcategoryOnRegister) {
    return customSelect(
      'SELECT *'
      'FROM item_pricing_rule'
      'WHERE'
      '(apply_on = '
      'Item Code'
      ' AND item_code = $itemCode AND min_quantity <= $numOfItemOnRegister)'
      '(OR apply_on = '
      'Item Group'
      ' AND item_group = $itemGroup AND min_quantity <= $numOfItemGroupOnRegister)'
      '(OR apply_on = '
      'Item Group'
      ' AND item_group = '
      'All Item Groups'
      ' AND min_quantity <= $numOfAllItemsOnRegister)'
      '(OR apply_on = '
      'Category'
      ' AND category = $category AND min_quantity <= $numOfcategoryOnRegister)'
      '(OR applicable_for = '
      'Customer Group'
      ' AND customer_group = $customerGroup)'
      '(OR applicable_for = '
      'Customer'
      ' AND customer_name = $customer)'
      '(OR applicable_for = '
      'Territory'
      ' AND customer_territory = $territory)'
      '(OR applicable_for = '
      'Sales Partner'
      ' AND parent_group = $partner)'
      'AND price_list_name = $priceList'
      'AND valid_from <= $validFrom'
      'AND valid_to >= $validTo'
      'AND is_active == $isActive',
      readsFrom: {
        db.itemPricingRule
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) {
      return rows
          .map((row) => ItemPricingRuleData.fromData(row.data, db))
          .toList();
    });
  }
}
