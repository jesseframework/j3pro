import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class UPCCode extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get upcCode => text().nullable()();
  TextColumn get codeType => text().nullable()();
  TextColumn get itemId => text().nullable()();
  TextColumn get tenantId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
