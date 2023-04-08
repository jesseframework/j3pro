import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/account/currency/currency_model.dart';

import 'package:drift/drift.dart';

part 'currency_crud.g.dart';

@DriftAccessor(tables: [SystemCurrency])
class SystemCurrencyDao extends DatabaseAccessor<MyDatabase> with _$SystemCurrencyDaoMixin {
  final MyDatabase db;
  SystemCurrencyDao(this.db) : super(db);

  Future<List<SystemCurrencyData>> getAllSystemCurrency() {
    return (select(db.systemCurrency).get());
  }

  Future<List<SystemCurrencyData>> getAllSystemCurrencyByName(String currencyname) {
    return (select(db.systemCurrency)..where((t) => t.currencyName.equals(currencyname))).get();
  }

  Future<void> createOrUpdateCurrency(SystemCurrencyData systemCurrencyData) {
    return into(db.systemCurrency).insertOnConflictUpdate(systemCurrencyData);
  }
}
