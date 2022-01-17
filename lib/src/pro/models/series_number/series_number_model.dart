import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class SeriesNumberGenerator extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get numberPrefix => text().nullable()();
  IntColumn get tenantId => integer().nullable()();
  BoolColumn get includePrefix => boolean().withDefault(Constant(false))();
  BoolColumn get includeJulianDate => boolean().withDefault(Constant(false))();
  BoolColumn get includeUserID => boolean().withDefault(Constant(false))();
  BoolColumn get includeTenantId => boolean().withDefault(Constant(false))();
  BoolColumn get usedAutoNumber => boolean().withDefault(Constant(false))();
  IntColumn get endingLength => integer().nullable()();
  TextColumn get typeOfNumber => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
