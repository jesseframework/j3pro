import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class StockUnitOfMeasure extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get itemId => text().nullable()();
  TextColumn get uom => text().nullable()();
  IntColumn get tenantId => integer().nullable()();
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
