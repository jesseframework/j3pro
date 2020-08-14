import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class Address extends Table implements MustHaveTenant, FullAudited {
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
