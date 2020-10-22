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

  Future<List<ItemPricingRuleData>> getAllDiscount(
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
      double numOfcategoryOnRegister) async {
    return (select(db.itemPricingRule)
          ..where((t) =>
              ((t.applyOn.equals('Item Code') &
                      t.itemCode.equals(itemCode) &
                      t.minQuantity
                          .isSmallerOrEqualValue(numOfItemOnRegister)) |
                  (t.applyOn.equals('Item Group') &
                      t.itemGroup.equals(itemGroup) &
                      t.minQuantity
                          .isSmallerOrEqualValue(numOfItemGroupOnRegister)) |
                  (t.applyOn.equals('Item Group') &
                      t.itemGroup.equals('All Item Groups') &
                      t.minQuantity
                          .isSmallerOrEqualValue(numOfAllItemsOnRegister)) |
                  (t.applyOn.equals('Category') &
                      t.category.equals(category) &
                      t.minQuantity
                          .isSmallerOrEqualValue(numOfcategoryOnRegister))) &
              ((t.applicableFor.equals('Customer Group') &
                      t.customerGroup.equals(customerGroup)) |
                  (t.applicableFor.equals('Customer') &
                      t.customerId.equals(customer))) &
              t.priceList.equals(priceList) &
              t.validFrom.isSmallerThanValue(validFrom) &
              t.validTo.isBiggerOrEqualValue(validTo) &
              t.isActive.equals(isActive)))
        .get();
  }
}
