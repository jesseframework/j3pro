import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_schedule_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';

import 'package:j3enterprise/src/resources/api_clients/api_client.dart';
import 'package:j3enterprise/src/resources/services/rest_api_service.dart';
import 'package:j3enterprise/src/resources/shared/function/update_backgroung_job_schedule_status.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:logging/logging.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:drift/drift.dart' as moor;

class GeoLocation {
  var api = ApiClient.chopper.getService<RestApiService>();
  var db;

  late bool isStopped = false;

  static final _log = Logger('Journey Plan Location Service');
  late UpdateBackgroundJobStatus updateBackgroundJobStatus;
  late BackgroundJobScheduleDao backgroundJobScheduleDao;
  late JourneyPlanDao journeyPlanDao;
  late AddressDao addressDao;
  late UserSharedData userSharedData;
  late Position _currentPosition;
  late SystemCurrencyDao systemCurrencyDao;

  GeoLocation() {
    _log.finest("Journey Plan Location Service constructer call");
    db = MyDatabase();
    updateBackgroundJobStatus = new UpdateBackgroundJobStatus();
    backgroundJobScheduleDao = new BackgroundJobScheduleDao(db);
    journeyPlanDao = new JourneyPlanDao(db);
    addressDao = new AddressDao(db);
    userSharedData = new UserSharedData();
    _currentPosition = new Position(accuracy: 0, altitude: 0, heading: 0, latitude: 0, longitude: 0, speed: 0, speedAccuracy: 0, timestamp: DateTime.now(),altitudeAccuracy: 0.0,headingAccuracy: 0.0);
    systemCurrencyDao = new SystemCurrencyDao(db);
  }

  //Earth Radious in meters
  double earthRadius = 6371000;

//Use Geolocator to find the current location(latitude & longitude)
  getUserLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
      }
    }
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

//Calculating the distance between two points
  getDistance(String jobName) async {
    try {
      String className = "Journey Plan Location Service";
      //ToDo code review to get a better way to push bulk data to API and update bulk data in database
      _log.finest("Executing $className date from server");
      var isSchedulerEnable = await backgroundJobScheduleDao.getJob(jobName);
      if (isSchedulerEnable != null) {
        _log.finest("$className job found in background Jobs scheduler");
        if (isSchedulerEnable.startDateTime.isBefore(DateTime.now())) {
          if (isSchedulerEnable.enableJob == true) {
            DateTime startDate = isSchedulerEnable.startDateTime;
            _log.finest("$className jobs start date is $startDate ");
            var getUser = await userSharedData.getUserSharedPref();
            String userName = getUser['userName'];

            var items = await journeyPlanDao.getAllJourneyPlanByUser(userName);
            for (var item in items) {
              if (isStopped) break;
              if (item.transactionStatus != "Complete") {
                var getaddr = await addressDao.getAllAddressByTitle(item.customerId);
                if (getaddr.length > 0) {
                  _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                  double inMiles = 0;
                  double inKilometer = 0;
                  double inMeter = 0;
                  double distantUsed = 0;
                  double formatedDistantUsed = 0;
                  String distanceLabel = "";

                  double pLat = getaddr[0].latitude!;
                  double pLng = getaddr[0].longitude!;
                  var dLat = radians(pLat - _currentPosition.latitude);
                  var dLng = radians(pLng - _currentPosition.longitude);
                  var a =
                      sin(dLat / 2) * sin(dLat / 2) + cos(radians(_currentPosition.latitude)) * cos(radians(pLat)) * sin(dLng / 2) * sin(dLng / 2);
                  var c = 2 * atan2(sqrt(a), sqrt(1 - a));
                  inMeter = earthRadius * c;
                  inMiles = inMeter * 0.000621;
                  inKilometer = inMeter * 0.001;
                  if (inMeter < 1000) {
                    distantUsed = inMeter;
                    distanceLabel = "m";
                  } else if (inMeter > 1000) {
                    distantUsed = inKilometer;
                    distanceLabel = "Km";
                  } else if (inKilometer > 1.60934) {
                    distantUsed = inMiles;
                    distanceLabel = "Mi";
                  }

                  //ToDo Add location to currency

                  var currency = await systemCurrencyDao.getAllSystemCurrencyByName("JMD");
                  if (currency.length > 0) {
                    var f = new NumberFormat(currency[0].numberFormat, "en_US");
                    formatedDistantUsed = double.tryParse(f.format(distantUsed))!;
                  } else {
                    var f = new NumberFormat("###.0#", "en_US");
                    formatedDistantUsed = double.tryParse(f.format(distantUsed))!;
                  }

                  //print(f.format(distantUsed).toString());

                  var updateDistant = new JourneyPlanCompanion(
                      distanceLabel: moor.Value(distanceLabel),
                      inKilometer: moor.Value(inKilometer),
                      inMeter: moor.Value(inMeter),
                      inMiles: moor.Value(inMiles),
                      distanceUsed: moor.Value(formatedDistantUsed));
                  await journeyPlanDao.updateGPSDistance(updateDistant, item.customerId, item.assignTo!, item.transactionStatus!);
                }
              }
            }
            updateBackgroundJobStatus.updateJobStatus(jobName, "Success");
          }
        }
      }
    } catch (e) {
      updateBackgroundJobStatus.updateJobStatus(jobName, "Error");
      _log.shout(e, StackTrace.current);
    }
    //Using pLat and pLng as dummy location
  }
}
