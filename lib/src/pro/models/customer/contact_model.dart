import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class Contact extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get contactTitle => text().nullable()();
  TextColumn get customerId => text().nullable()();
  TextColumn get contactPerson => text().nullable()();
  TextColumn get workNumber => text().nullable()();
  TextColumn get cellNumber => text().nullable()();
  TextColumn get whatappNumber => text().nullable()();
  BoolColumn get isYourCompanyContact => boolean().withDefault(Constant(false)).nullable()();
  BoolColumn get isPrimaryContact => boolean().withDefault(Constant(false)).nullable()();
  BoolColumn get isUserContact => boolean().withDefault(Constant(false)).nullable()();
  TextColumn get userName => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
