import 'package:j3enterprise/src/database/crud/application_logger/app_logger_crud.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_logs_crud.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_schedule_crud.dart';
import 'package:j3enterprise/src/database/crud/business_rule/business_rule_crud.dart';
import 'package:j3enterprise/src/database/crud/communication/communication_setup_crud.dart';
import 'package:j3enterprise/src/database/crud/mobile_device/mobile_device_crud.dart';
import 'package:j3enterprise/src/database/crud/prefrence/preference_crud.dart';
import 'package:j3enterprise/src/database/crud/tenant/tenant_crud.dart';
import 'package:j3enterprise/src/database/crud/user/user_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
 

class ResetDatabase {
  late UserDao userDao;
  late CommunicationDao communicationDao;
  late BackgroundJobScheduleDao backgroundJobScheduleDao;
  late BackgroundJobLogsDao backgroundJobLogsDao;
  late ApplicationLoggerView applicationLoggerDao;
  late MobileDeviceDao mobileDeviceDao;
  late PreferenceDao preferencesDao;
  late BusinessRuleDao businessRuleDao;
  late TenantDao tenantDao;
  var db;

  ResetDatabase() {
    db = MyDatabase();
    userDao = UserDao(db);
    communicationDao = CommunicationDao(db);
    backgroundJobScheduleDao = BackgroundJobScheduleDao(db);
    backgroundJobLogsDao = BackgroundJobLogsDao(db);
    applicationLoggerDao = ApplicationLoggerView(db);
    tenantDao = TenantDao(db);
    businessRuleDao = BusinessRuleDao(db);
    preferencesDao = PreferenceDao(db);
    mobileDeviceDao = MobileDeviceDao(db);
  }

  Future<void> resetAllData() async {
    await userDao.deleteAllUser();
    await communicationDao.deleteAllCommuniction();
    await backgroundJobLogsDao.deleteAllBackgroundJobsLog();
    await backgroundJobScheduleDao.deleteBackgroundJobs();
    await applicationLoggerDao.deleteAllAppLog();
    await tenantDao.deleteAllTenant();
    await businessRuleDao.deleteAllBusinessRule();
    await preferencesDao.deleteAllPreferences();
    await mobileDeviceDao.deleteAllBusinessRule();
  }
}
