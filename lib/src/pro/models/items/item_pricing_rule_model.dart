import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class ItemPricingRule extends Table implements MustHaveTenant, FullAudited {
  IntColumn get id => integer()();
  IntColumn get itemId => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get itemCode => text().nullable()();
  TextColumn get priceList => text().nullable()();
  TextColumn get customerId => text().nullable()();
  RealColumn get minQuantity => real()();
  RealColumn get maxQuantity => real()();
  RealColumn get price => real()();
  RealColumn get discountPercentage => real()();
  TextColumn get uom => text().nullable()();
  TextColumn get priceOrDiscount => text().nullable()();
  TextColumn get customerGroup => text().nullable()();
  TextColumn get itemGroup => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get applicableFor => text().nullable()();
  TextColumn get applyOn => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get ruleName => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(Constant(false))();
  BoolColumn get isDiscountEnable => boolean().withDefault(Constant(false))();
  DateTimeColumn get validFrom => dateTime().nullable()();
  DateTimeColumn get validTo => dateTime().nullable()();

  IntColumn get createUserId => integer().nullable()();
  DateTimeColumn get creationTime => dateTime().nullable()();
  DateTimeColumn get deleteTime => dateTime().nullable()();
  IntColumn get deleteUserId => integer().nullable()();
  TextColumn get creatorUser => text().nullable()();
  TextColumn get deleterUserId => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  TextColumn get lastModifierUser => text().nullable()();
  IntColumn get lastModifierUserId => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
