import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class ItemPrice extends Table implements MustHaveTenant, FullAudited {
  IntColumn get id => integer()();
  IntColumn get itemId => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get itemCode => text().nullable()();
  TextColumn get priceList => text().nullable()();
  TextColumn get itemName => text().nullable()();
  RealColumn get itemPrice => real()();
  RealColumn get returnPrice => real()();
  RealColumn get deposit => real()();
  RealColumn get shippingCost => real()();
  RealColumn get sellingDeposit => real()();
  RealColumn get returnDeposit => real()();
  RealColumn get conversionFactor => real()();
  RealColumn get actualPoints => real()();
  TextColumn get uom => text().nullable()();
  TextColumn get currency => text().nullable()();
  IntColumn get pricingScheduleNo => integer()();
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
