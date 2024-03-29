
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/account/exchange_rate/exchange_rate_model.dart';

import 'package:drift/drift.dart';

part 'exchange_rate.g.dart';

@DriftAccessor(tables: [ExchangeRate])
class ExchangeRateDao extends DatabaseAccessor<MyDatabase> with _$ExchangeRateDaoMixin {
  final MyDatabase db;
  ExchangeRateDao(this.db) : super(db);

  Future<List<ExchangeRateData>> getAllExchnageRate() {
    return (select(db.exchangeRate).get());
  }

  Future<List<ExchangeRateData>> getAllExchnageRateByCurrency(String fromCurrencye, String toCurrencye) {
    return (select(db.exchangeRate)..where((t) => t.fromCurrency.equals(fromCurrencye) & t.toCurrency.equals(toCurrencye))).get();
  }

  Future<void> createOrUpdateExchnageRate(ExchangeRateData exchangeRateData) {
    return into(db.exchangeRate).insertOnConflictUpdate(exchangeRateData);
  }
}
