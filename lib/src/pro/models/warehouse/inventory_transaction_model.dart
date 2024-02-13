import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class InventoryTransaction extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get itemCode => text().nullable()();
  TextColumn get itemName => text().nullable()();
  TextColumn get itemId => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get itemGroup => text().nullable()();
  TextColumn get stockUom => text().nullable()();
  TextColumn get salesUom => text().nullable()();
  TextColumn get transactionNumber => text().nullable()();
  RealColumn get quantityMove => real()();
  RealColumn get quantityMoveConvert => real()();
  RealColumn get conversionFactor => real()();
  RealColumn get costPrice => real()();
  RealColumn get itemPrice => real()();
  TextColumn get transactionType => text().nullable()();
  TextColumn get reasonCode => text().nullable()();
  TextColumn get inventoryCycle => text().nullable()();
  TextColumn get toWarehouse => text().nullable()();
  TextColumn get fromWarehouse => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
