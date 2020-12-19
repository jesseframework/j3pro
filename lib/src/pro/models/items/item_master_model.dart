import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class Items extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get itemId => text()();  
  TextColumn get description => text().nullable()();
  TextColumn get itemCode => text().nullable()();
  TextColumn get itemName => text().nullable()();
  TextColumn get itemGroup => text().nullable()();
  TextColumn get taxGroup => text().nullable()();
  TextColumn get uom => text().nullable()();
  BoolColumn get trackInventory => boolean().withDefault(Constant(false))();
  TextColumn get category => text().nullable()();
  BoolColumn get isProductBundleParent =>  boolean().withDefault(Constant(false))();
  BoolColumn get isQuickMenue => boolean().withDefault(Constant(false))();
  BoolColumn get isRetired => boolean().withDefault(Constant(false))();
  DateTimeColumn get retiredDate => dateTime().nullable()();
  BoolColumn get hasVariant => boolean().withDefault(Constant(false))();
  TextColumn get defaultWarehouse => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  IntColumn get tenantId => integer().nullable()();


  @override
  Set<Column> get primaryKey => {itemId};
}
