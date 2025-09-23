import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/series_number_crud.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';
import 'package:random_string/random_string.dart';

class NumberGenerator {
  var db;
  String setNumberPrefix = "";
  String setJulianDate = "";
  String setUserId = "";
  String setTenantId = "";
  String setAutoNumber = "";
  String setNextIncrement = "";
  static final _log = Logger('SerialNumberGenerator');
  late SeriesNumberGeneratorDao seriesNumberGeneratorDao;
  late UserSharedData userSharedData;
  Map<String, String> mapDevicePref = {};

  NumberGenerator() {
    _log.finest("number generator constructor call");
    db = MyDatabase();
    seriesNumberGeneratorDao = SeriesNumberGeneratorDao(db);
    userSharedData = UserSharedData();
  }

  String _getJulianDay() {
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;
    // Format to YYDDD, e.g. 23001 for Jan 1st 2023
    return '${now.year.toString().substring(now.year.toString().length - 2)}${dayOfYear.toString().padLeft(3, '0')}';
  }

  Future<String> getSerialNumber(
      String typeOfNumber, int nextIncrementNumber, int endingLength) async {
    _log.finest("start create new serial number");
    String seriesNumber;

    var getSeries =
        await seriesNumberGeneratorDao.getAllSeriesNumberByType(typeOfNumber);
    if (getSeries.isNotEmpty) {
      _log.finest("check for prefix in serial number");
      if (getSeries[0].includePrefix == true) {
        setNumberPrefix = getSeries[0].numberPrefix ?? "";
      }

      if (getSeries[0].includeJulianDate == true) {
        _log.finest("set julian date code");
        setJulianDate = _getJulianDay();
      }

      if (getSeries[0].includeUserID == true) {
        _log.finest("get userid from shared prefrence");
        mapDevicePref =
            await userSharedData.getUserSharedPref() as Map<String, String>;
        setUserId = mapDevicePref['userId'] ?? "";
      }

      if (getSeries[0].includeTenantId == true) {
        _log.finest("get tenantid from sahre prefrence");
        mapDevicePref =
            await userSharedData.getUserSharedPref() as Map<String, String>;
        setTenantId = mapDevicePref['tenantId'] ?? "";
      }

      if (getSeries[0].usedAutoNumber == true) {
        _log.finest("get last document number form datbase");
        int len = getSeries[0].endingLength ?? endingLength;
        setNextIncrement = nextIncrementNumber.toString().padLeft(len, '0');
      } else {
        _log.finest("generate randon number");
        setNextIncrement = randomNumeric(getSeries[0].endingLength ?? 10);
      }
      _log.finest("create number");

      seriesNumber =
          '$setNumberPrefix$setUserId$setTenantId$setJulianDate$setNextIncrement';
    } else {
      if (endingLength <= 0) {
        endingLength = 4;
      }
      _log.finest("used randon number only");
      setNextIncrement = randomNumeric(endingLength);

      seriesNumber =
          '$setNumberPrefix$setUserId$setTenantId$setJulianDate$setNextIncrement';
    }

    return seriesNumber.replaceAll(' ', '');
  }
}
