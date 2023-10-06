import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class Address extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get customerId => text().nullable()();
  TextColumn get addressTitle => text().nullable()();
  TextColumn get addressType => text().nullable()();
  TextColumn get addressLine1 => text().nullable()();
  TextColumn get addressLine2 => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get apartment => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get zipCode => text().nullable()();
  TextColumn get contactPerson => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  BoolColumn get isYourCompanyAddress =>
      boolean().withDefault(Constant(false)).nullable()();
  BoolColumn get isPrimaryAddress => boolean().withDefault(Constant(false)).nullable()();
  BoolColumn get isShippingAddress => boolean().withDefault(Constant(false)).nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false)).nullable()();

 @override
  Set<Column> get primaryKey => {id};
}
