import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class SalesTax extends Table implements MustHaveTenant {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get taxAccount => text().nullable()();
  RealColumn get accountRate => real().nullable()();
  DateTimeColumn get effectiveDate => dateTime()();
  RealColumn get amount => real().nullable()();
  TextColumn get taxIndicator => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
