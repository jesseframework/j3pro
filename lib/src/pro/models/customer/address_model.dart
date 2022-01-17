import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class Address extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get customerId => text()();
  TextColumn get addressTitle => text()();
  TextColumn get addressType => text()();
  TextColumn get addressLine1 => text()();
  TextColumn get addressLine2 => text()();
  TextColumn get city => text()();
  TextColumn get state => text()();
  TextColumn get apartment => text()();
  TextColumn get country => text()();
  TextColumn get zipCode => text()();
  TextColumn get contactPerson => text()();
  TextColumn get phoneNumber => text()();
  BoolColumn get isYourCompanyAddress =>
      boolean().withDefault(Constant(false))();
  BoolColumn get isPrimaryAddress => boolean().withDefault(Constant(false))();
  BoolColumn get isShippingAddress => boolean().withDefault(Constant(false))();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
