import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class TempNumberLogs extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get nextSeriesNumber => text().nullable()();
  TextColumn get lastSeriesNumber => text().nullable()();
  DateTimeColumn get lastUsageDate => dateTime()();
  TextColumn get userName => text().nullable()();
  TextColumn get typeOfNumber => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
