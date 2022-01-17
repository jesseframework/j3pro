import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class Contact extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get contactTitle => text()();
  TextColumn get customerId => text()();
  TextColumn get contactPerson => text()();
  TextColumn get workNumber => text()();
  TextColumn get cellNumber => text()();
  TextColumn get whatappNumber => text()();
  BoolColumn get isYourCompanyContact =>
      boolean().withDefault(Constant(false))();
  BoolColumn get isPrimaryContact => boolean().withDefault(Constant(false))();
  BoolColumn get isUserContact => boolean().withDefault(Constant(false))();
  TextColumn get userName => text()();

  @override
  Set<Column> get primaryKey => {id};
}
