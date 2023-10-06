import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class Customer extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get customerId => text().nullable()();
  TextColumn get customerName => text().nullable()();
  TextColumn get companyName => text().nullable()();
  TextColumn get customerType => text().nullable()();
  TextColumn get customerGroup => text().nullable()();
  TextColumn get customerTerritory => text().nullable()();
  TextColumn get defaultCurrency => text().nullable()();
  TextColumn get paymentTerms => text().nullable()();
  TextColumn get language => text().nullable()();
  RealColumn get creditLimit => real().nullable()();
  TextColumn get billingAddressName => text().nullable().nullable()();
  TextColumn get shippingAddressName => text().nullable().nullable()();
  TextColumn get contactName => text().nullable().nullable()();
  TextColumn get priceList => text().nullable().nullable()();
  RealColumn get minQuantity => real().nullable()();
  RealColumn get maxQuantity => real().nullable()();
  TextColumn get discountType => text().nullable()();
  RealColumn get discountPercentage => real().nullable()();
  RealColumn get discountAmount => real().nullable()();
  BoolColumn get enableHeaderDiscount =>
      boolean().withDefault(Constant(false)).nullable()();
  RealColumn get accumulatedPurchase => real().nullable()();
  DateTimeColumn get validFrom => dateTime().nullable()();
  DateTimeColumn get validTo => dateTime().nullable()();
  TextColumn get taxId => text().nullable()();
  TextColumn get taxGroup => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};

 
}
