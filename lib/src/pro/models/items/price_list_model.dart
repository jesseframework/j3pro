import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class PriceList extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get priceListName => text()();
  TextColumn get currency => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(Constant(false))();
  BoolColumn get isBuying => boolean().withDefault(Constant(false))();
  BoolColumn get isSelling => boolean().withDefault(Constant(false))();
  BoolColumn get isPriceNotUOMDependency => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
