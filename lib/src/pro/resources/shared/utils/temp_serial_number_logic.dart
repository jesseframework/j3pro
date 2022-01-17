import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/temp_number_log_crud.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;

class TempSerialNumberReader {
  var db;
  static final _log = Logger('TempSerialNumberReader');
  TempNumberLogsDao tempNumberLogsDao;

  TempSerialNumberReader() {
    _log.finest("serail number reader constructor call");
    db = AppDatabase();
    tempNumberLogsDao = new TempNumberLogsDao(db);
  }

  Future<String> getTempNumber({String typeOfNumber}) async {
    String numberSet = "";
    var temNumbers =
        await tempNumberLogsDao.getAllTempNumberLogsByType(typeOfNumber);
    if (temNumbers.length > 0) {
      numberSet = temNumbers[0].nextSeriesNumber;
    }
    return numberSet;
  }

  Future setTempNumber(
      String typeOfNumber,
      String transactionNumber,
      DateTime lastUsed,
      String userName,
      int tenantId,
      String numberGenerator) async {
    var tempNumber = new TempNumberLogsCompanion(
        tenantId: moor.Value(tenantId),
        nextSeriesNumber: moor.Value(numberGenerator.toString()),
        lastSeriesNumber: moor.Value(transactionNumber),
        lastUsageDate: moor.Value(DateTime.now()),
        userName: moor.Value(userName),
        typeOfNumber: moor.Value(typeOfNumber));

    await tempNumberLogsDao.createOrUpdateTempNumber(tempNumber);
  }
}
