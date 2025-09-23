import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class PriceList extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get priceListName => text()();
  TextColumn get currency => text().nullable()();
  @override
  IntColumn get tenantId => integer().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  BoolColumn get isBuying => boolean().withDefault(const Constant(false))();
  BoolColumn get isSelling => boolean().withDefault(const Constant(false))();
  BoolColumn get isPriceNotUOMDependency =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
