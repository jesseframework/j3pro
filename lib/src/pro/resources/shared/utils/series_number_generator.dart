import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/series_number_crud.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';
import 'package:random_string_one/random_string.dart';
import 'package:shamsi_date/shamsi_date.dart';

class NumberGenerator {
  var db;
  String setNumberPrefix;
  String setJulianDate;
  String setUserId;
  String setTenantId;
  String setAutoNumber;
  String setNextIncrement;
  static final _log = Logger('SerialNumberGenerator');
  SeriesNumberGeneratorDao seriesNumberGeneratorDao;
  UserSharedData userSharedData;
  Map<String, String> mapDevicePref = Map();

  NumberGenerator() {
    _log.finest("number generator constructor call");
    db = AppDatabase();
    seriesNumberGeneratorDao = new SeriesNumberGeneratorDao(db);
    userSharedData = new UserSharedData();
  }

  String _format(Date d) {
    _log.finest("checking for julian date");

    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  }

  Future<String> getSerialNumber(
      String typeOfNumber, int nextIncrementNumber, int endingLength) async {
    _log.finest("start create new serial number");
    String seriesNumber;

    var getSeries =
        await seriesNumberGeneratorDao.getAllSeriesNumberByType(typeOfNumber);
    if (getSeries != null && getSeries.length > 0) {
      _log.finest("check for prefix in serial number");
      if (getSeries[0].includePrefix == true) {
        setNumberPrefix = getSeries[0].numberPrefix;
      }

      if (getSeries[0].includeJulianDate == true) {
        _log.finest("set julian date code");
        setJulianDate = _format(Jalali.now());
      }

      if (getSeries[0].includeUserID == true) {
        _log.finest("get userid from shared prefrence");
        mapDevicePref = await userSharedData.getUserSharedPref();
        setUserId = mapDevicePref['userId'];
      }

      if (getSeries[0].includetenantId == true) {
        _log.finest("get tenantid from sahre prefrence");
        mapDevicePref = await userSharedData.getUserSharedPref();
        setTenantId = mapDevicePref['tenantId'];
      }

      if (getSeries[0].usedAutoNumber == true) {
        _log.finest("get last document number form datbase");
        setNextIncrement = nextIncrementNumber.toString();
      } else {
        _log.finest("generate randon number");
        setNextIncrement = randomString(
          getSeries[0].endingLength,
          includeSymbols: false,
          includeLowercase: false,
          includeUppercase: false,
          exclusions: {'0', '1'},
        );
      }

      if (getSeries[0].endingLength > 0) {
      } else {
        endingLength = 4;
      }
      _log.finest("create number");

      seriesNumber =
          '$setNumberPrefix $setUserId $setTenantId $setJulianDate $setNextIncrement';
    } else {
      if (endingLength > 0) {
      } else {
        endingLength = 4;
      }
      _log.finest("used randon number only");
      setNextIncrement = randomString(
        endingLength,
        includeSymbols: false,
        includeLowercase: false,
        includeUppercase: false,
        exclusions: {'0', '1'},
      );
      seriesNumber =
          '$setNumberPrefix $setUserId $setTenantId $setJulianDate $setNextIncrement';
    }

    return seriesNumber.trim();
  }
}
