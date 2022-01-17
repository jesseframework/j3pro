import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class ItemGroups extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get itemId => text().nullable()();
  TextColumn get parentGroup => text().nullable()();
  TextColumn get group => text().nullable()();
  IntColumn get tenantId => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
