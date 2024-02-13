import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class MoneyDeposit extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get clockInDaySessionId => text().nullable()();
  TextColumn get clockOutDaySessionId => text().nullable()();
  TextColumn get depositId => text().nullable()();
  TextColumn get type => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get depositStatus => text().nullable()();
  TextColumn get userName => text().nullable()();
  RealColumn get denominator => real().nullable()();
  TextColumn get denominatorType => text().nullable()();
  TextColumn get depositDescription => text().nullable()();
  RealColumn get amount => real().nullable()();
  TextColumn get currency => text().nullable()();
  RealColumn get exchangeRate => real().nullable()();
  RealColumn get subTotal => real().nullable()();
  RealColumn get grandTotal => real().nullable()();
}
