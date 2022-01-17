import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class ClockIn extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get clockInDaySessionId => text().nullable()();
  TextColumn get clockOutDaySessionId => text().nullable()();
  TextColumn get inventoryCycleId => text().nullable()();
  TextColumn get fullName => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  DateTimeColumn get warehouseName => dateTime().nullable()();
  TextColumn get shiftName => text().nullable()();
  TextColumn get fleetNumber => text().nullable()();
  TextColumn get licensePlate => text().nullable()();
  TextColumn get userName => text().nullable()();
  TextColumn get sesionType => text().nullable()();
  TextColumn get sessionStatus => text().nullable()();
  TextColumn get deviceId => text().nullable()();
  RealColumn get depositAmount => real().nullable()();
  RealColumn get totalSales => real().nullable()();
  RealColumn get arPayment => real().nullable()();
  RealColumn get totalAmountDue => real().nullable()();
  RealColumn get balanceBroughtForward => real().nullable()();
  RealColumn get balanceAmount => real().nullable()();
  TextColumn get balanceText => text().nullable()();
  RealColumn get cashTransfer => real().nullable()();
  RealColumn get creditSales => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
