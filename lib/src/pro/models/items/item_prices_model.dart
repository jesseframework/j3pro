import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class ItemsPrices extends Table implements MustHaveTenant {
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

  @override
  Set<Column> get primaryKey => {id};
}
