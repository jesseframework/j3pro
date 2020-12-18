import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class Categores extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get itemId => integer()();
  TextColumn get parentCategory => text().nullable()();
  TextColumn get category => text().nullable()();
  IntColumn get tenantId => integer().nullable()();


  @override
  Set<Column> get primaryKey => {id};
}
