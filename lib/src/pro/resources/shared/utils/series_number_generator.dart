import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/series_number/series_number_crud.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';
import 'package:random_string_generator/random_string_generator.dart';
import 'package:shamsi_date/shamsi_date.dart';

class NumberGenerator {
  var db;
  late String setNumberPrefix;
  late String setJulianDate;
  late String setUserId;
  late String setTenantId;
  late String setAutoNumber;
  late String setNextIncrement;
  static final _log = Logger('SerialNumberGenerator');
  late SeriesNumberGeneratorDao seriesNumberGeneratorDao;
  late UserSharedData userSharedData;
  Map<String, String> mapDevicePref = Map();

  NumberGenerator() {
    _log.finest("number generator constructor call");
    db = MyDatabase();
    seriesNumberGeneratorDao = new SeriesNumberGeneratorDao(db);
    userSharedData = new UserSharedData();
  }

  Future<String> getSerialNumber(String typeOfNumber, int nextIncrementNumber, int endingLength) async {
    _log.finest("start create new serial number");
    String seriesNumber;

    var getSeries = await seriesNumberGeneratorDao.getAllSeriesNumberByType(typeOfNumber);
    if (getSeries != null && getSeries.length > 0) {
      _log.finest("check for prefix in serial number");
      if (getSeries[0].includePrefix == true) {
        setNumberPrefix = getSeries[0].numberPrefix!;
      }

      if (getSeries[0].includeJulianDate == true) {
        _log.finest("set julian date code");

        Jalali j = Jalali(DateTime.now().year, DateTime.now().month, DateTime.now().day);

        setJulianDate = j.julianDayNumber.toString();
      }

      if (getSeries[0].includeUserID == true) {
        _log.finest("get userid from shared prefrence");
        mapDevicePref = await userSharedData.getUserSharedPref() as Map<String, String>;
        setUserId = mapDevicePref['userId']!;
      }

      if (getSeries[0].includeTenantId == true) {
        _log.finest("get tenantid from sahre prefrence");
        mapDevicePref = await userSharedData.getUserSharedPref() as Map<String, String>;
        setTenantId = mapDevicePref['tenantId']!;
      }

      if (getSeries[0].usedAutoNumber == true) {
        _log.finest("get last document number form datbase");

        setNextIncrement = nextIncrementNumber.toString().padLeft(getSeries[0].endingLength!);

        setNextIncrement = nextIncrementNumber.toString();
      } else {
        _log.finest("generate randon number");
        setNextIncrement = RandomStringGenerator(
          hasAlpha: false,
          alphaCase: AlphaCase.UPPERCASE_ONLY,
          hasDigits: true,
          hasSymbols: false,
          minLength: 10,
          maxLength: 10,
          mustHaveAtLeastOneOfEach: true,
        ) as String;
      }

      if (getSeries[0].endingLength! > 0) {
      } else {
        endingLength = 4;
      }
      _log.finest("create number");

      seriesNumber = '$setNumberPrefix $setUserId $setTenantId $setJulianDate $setNextIncrement';
    } else {
      if (endingLength > 0) {
      } else {
        endingLength = 4;
      }
      _log.finest("used randon number only");
      // setNextIncrement = randomString(
      //   endingLength,
      //   includeSymbols: false,
      //   includeLowercase: false,
      //   includeUppercase: false,
      //   exclusions: {'0', '1'},
      // ).padLeft(endingLength);
      setNextIncrement = RandomStringGenerator(
        hasAlpha: false,
        alphaCase: AlphaCase.UPPERCASE_ONLY,
        hasDigits: true,
        hasSymbols: false,
        minLength: 10,
        maxLength: 10,
        mustHaveAtLeastOneOfEach: true,
      ) as String;

      seriesNumber = '$setNumberPrefix $setUserId $setTenantId $setJulianDate $setNextIncrement';
    }

    return seriesNumber.trim();
  }
}
