import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/series_number/temp_number_logs.dart';
import 'package:drift/drift.dart';

part 'temp_number_log_crud.g.dart';

@DriftAccessor(tables: [TempNumberLogs])
class TempNumberLogsDao extends DatabaseAccessor<MyDatabase> with _$TempNumberLogsDaoMixin {
  final MyDatabase db;
  TempNumberLogsDao(this.db) : super(db);

  Future<List<TempNumberLog>> getAllTempNumberLogs() {
    return (select(db.tempNumberLogs).get());
  }

  Stream<List<TempNumberLog>> watchAllTempNumberLogsByType(String typeOfNumber) {
    return (select(db.tempNumberLogs)..where((t) => t.typeOfNumber.equals(typeOfNumber))).watch();
  }

  Future<List<TempNumberLog>> getAllTempNumberLogsByType(String typeOfNumber) {
    return (select(db.tempNumberLogs)..where((t) => t.typeOfNumber.equals(typeOfNumber))).get();
  }

  Future<List<TempNumberLog>> getAllSeriesNumberByType() {
    return (select(db.tempNumberLogs)).get();
  }

  Future<void> createOrUpdateTempNumber(TempNumberLogsCompanion tempNumberLog) {
    return into(db.tempNumberLogs).insertOnConflictUpdate(tempNumberLog);
  }

  Future deleteAllTempNumberLog() => delete(db.tempNumberLogs).go();
}
