import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class ExchangeRate extends Table implements MustHaveTenant {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get toCurrency => text().nullable()();
  TextColumn get fromCurrency => text().nullable()();
  RealColumn get exchangeRate => real().nullable()();
  DateTimeColumn get effectiveDate => dateTime()();
  BoolColumn get isActive => boolean().withDefault(Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
