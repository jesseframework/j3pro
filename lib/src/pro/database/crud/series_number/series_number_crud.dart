import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/series_number/series_number_model.dart';

import 'package:moor/moor.dart';

part 'series_number_crud.g.dart';

@UseDao(tables: [SeriesNumberGenerator])
class SeriesNumberGeneratorDao extends DatabaseAccessor<AppDatabase>
    with _$SeriesNumberGeneratorDaoMixin {
  final AppDatabase db;
  SeriesNumberGeneratorDao(this.db) : super(db);

  Future<List<SeriesNumberGeneratorData>> getAllAllSeriesNumber() {
    return (select(db.seriesNumberGenerator).get());
  }

  Stream<List<SeriesNumberGeneratorData>> watchAllSeriesNumberByType(
      String typeOfNumber) {
    return (select(db.seriesNumberGenerator)
          ..where((t) => t.typeOfNumber.equals(typeOfNumber)))
        .watch();
  }

   Future<List<SeriesNumberGeneratorData>> getAllSeriesNumberByType(
      String typeOfNumber) {
    return (select(db.seriesNumberGenerator)
          ..where((t) => t.typeOfNumber.equals(typeOfNumber)))
        .get();
  }

  Future<void> createOrUpdateSeriesNumber(
      SeriesNumberGeneratorData seriesNumberGeneratorData) {
    return into(db.seriesNumberGenerator)
        .insertOnConflictUpdate(seriesNumberGeneratorData);
  }

  Future deleteAllSeriesNumberGenerator() =>
      delete(db.seriesNumberGenerator).go();
}
