import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class UnitOfMeasure extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get uom => text().nullable()();
  IntColumn get tenantId => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
