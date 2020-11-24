import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class InventoryItems extends Table implements MustHaveTenant, FullAudited {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get itemCode => text().nullable()();
  TextColumn get itemName => text().nullable()();
  TextColumn get uom => text().nullable()();
  TextColumn get defaultWarehouse => text().nullable()();
  RealColumn get quantityOnHand => real()();
  RealColumn get quantityAvailable => real()();
  RealColumn get quantityAdjust => real()();
  RealColumn get quantitySoldOnInvoice => real()();
  RealColumn get quantitySoldOnOrder => real()();
  RealColumn get quantityCount => real()();
  TextColumn get inventoryCycleNumber => text()();
  IntColumn get createUserId => integer().nullable()();
  DateTimeColumn get creationTime => dateTime().nullable()();
  DateTimeColumn get deleteTime => dateTime().nullable()();
  IntColumn get deleteUserId => integer().nullable()();
  TextColumn get creatorUser => text().nullable()();
  TextColumn get deleterUserId => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  TextColumn get lastModifierUser => text().nullable()();
  IntColumn get lastModifierUserId => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
