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
  Stream<List<ItemPricingRuleData>> getAllDiscount(
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
        'SELECT '
        'discount_percentage, '
        'price_or_discount, '
        'price '
        'FROM item_pricing_rule'
        'WHERE'
        '(apply_on = '
        'Item Code'
        ' AND item_code = ? AND min_quantity <= ?)'
        '(OR apply_on = '
        'Item Group'
        ' AND item_group = ? AND min_quantity <= ?)'
        '(OR apply_on = '
        'Item Group'
        ' AND item_group = '
        'All Item Groups'
        ' AND min_quantity <= ?)'
        '(OR apply_on = '
        'Category'
        ' AND category = ? AND min_quantity <= ?)'
        '(OR applicable_for = '
        'Customer Group'
        ' AND customer_group = ?)'
        '(OR applicable_for = '
        'Customer'
        ' AND customer_name = ?)'
        '(OR applicable_for = '
        'Territory'
        ' AND customer_territory = ?)'
        '(OR applicable_for = '
        'Sales Partner'
        ' AND parent_group = ?)'
        'AND price_list_name = ?'
        'AND valid_from <= ?'
        'AND valid_to >= ?'
        'AND is_active == ?',
        readsFrom: {
          db.itemPricingRule
        },
        variables: [
          Variable.withString(itemCode),
          Variable.withReal(numOfItemOnRegister),
          Variable.withString(itemGroup),
          Variable.withReal(numOfItemGroupOnRegister),
          Variable.withReal(numOfAllItemsOnRegister),
          Variable.withString(category),
          Variable.withReal(numOfcategoryOnRegister),
          Variable.withString(customerGroup),
          Variable.withString(customer),
          Variable.withString(territory),
          Variable.withString(partner),
          Variable.withString(priceList),
          Variable.withDateTime(validFrom),
          Variable.withDateTime(validTo),
          Variable.withBool(isActive),
        ]).watch().map((rows) {
      return rows
          .map((row) => ItemPricingRuleData.fromData(row.data, db))
          .toList();
    });
  }
}
