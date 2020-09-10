import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/series_number/temp_number_logs.dart';
import 'package:moor/moor.dart';

part 'temp_number_log_crud.g.dart';

@UseDao(tables: [TempNumberLogs])
class TempNumberLogsDao extends DatabaseAccessor<AppDatabase>
    with _$TempNumberLogsDaoMixin {
  final AppDatabase db;
  TempNumberLogsDao(this.db) : super(db);

  Future<List<TempNumberLog>> getAllTempNumberLogs() {
    return (select(db.tempNumberLogs).get());
  }

  Stream<List<TempNumberLog>> watchAllTempNumberLogsByType(
      String typeOfNumber) {
    return (select(db.tempNumberLogs)
          ..where((t) => t.typeOfNumber.equals(typeOfNumber)))
        .watch();
  }

  Future<List<TempNumberLog>> getAllSeriesNumberByType(String typeOfNumber) {
    return (select(db.tempNumberLogs)
          ..where((t) => t.typeOfNumber.equals(typeOfNumber)))
        .get();
  }

  Future<void> createOrUpdateTempNumber(TempNumberLog tempNumberLog) {
    return into(db.tempNumberLogs).insertOnConflictUpdate(tempNumberLog);
  }

  Future deleteAllTempNumberLog() => delete(db.tempNumberLogs).go();
}
