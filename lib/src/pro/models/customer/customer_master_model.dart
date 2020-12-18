import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class Customer extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get customerId => text()();
  TextColumn get customerName => text()();
  TextColumn get companyName => text()();
  TextColumn get customerType => text()();
  TextColumn get customerGroup => text()();
  TextColumn get customerTerritory => text()();
  TextColumn get defaultCurrency => text()();
  TextColumn get paymentTerms => text()();
  TextColumn get language => text()();
  RealColumn get creditLimit => real()();
  TextColumn get billingAddressName => text().nullable()();
  TextColumn get shippingAddressName => text().nullable()();
  TextColumn get contactName => text().nullable()();
  TextColumn get priceList => text().nullable()();
  RealColumn get minQuantity => real()();
  RealColumn get maxQuantity => real()();
  TextColumn get discountType => text()();
  RealColumn get discountPercentage => real()();
  RealColumn get discountAmount => real()();
   BoolColumn get enableHeaderDiscount =>
      boolean().withDefault(Constant(false))(); 
  RealColumn get accumulatedPurchase => real()();
  DateTimeColumn get validFrom => dateTime()();
  DateTimeColumn get validTo => dateTime()();
  TextColumn get taxId => text()();
  TextColumn get taxGroup => text()();


  @override
  Set<Column> get primaryKey => {id};
}
