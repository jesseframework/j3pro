import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class SystemCurrency extends Table implements MustHaveTenant {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get currencyName => text().nullable()();
  TextColumn get fraction => text().nullable()();
  TextColumn get numberFormat => text().nullable()();
  TextColumn get symbol => text().nullable()();
  RealColumn get smallestCurrencyFractionValue => real().nullable()();
  DateTimeColumn get effectiveDate => dateTime()();
  BoolColumn get isActive => boolean().withDefault(Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
