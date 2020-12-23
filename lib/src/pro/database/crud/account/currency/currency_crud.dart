import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/account/currency/currency_model.dart';

import 'package:moor/moor.dart';

part 'currency_crud.g.dart';

@UseDao(tables: [SystemCurrency])
class SystemCurrencyDao extends DatabaseAccessor<AppDatabase>
    with _$SystemCurrencyDaoMixin {
  final AppDatabase db;
  SystemCurrencyDao(this.db) : super(db);

  Future<List<SystemCurrencyData>> getAllSystemCurrency() {
    return (select(db.systemCurrency).get());
  }

  Future<List<SystemCurrencyData>> getAllSalesTaxByGroup(String currencyname) {
    return (select(db.systemCurrency)
          ..where((t) => t.currencyName.equals(currencyname)))
        .get();
  }

  Future<void> createOrUpdateCurrency(SystemCurrencyData systemCurrencyData) {
    return into(db.systemCurrency).insertOnConflictUpdate(systemCurrencyData);
  }
}
