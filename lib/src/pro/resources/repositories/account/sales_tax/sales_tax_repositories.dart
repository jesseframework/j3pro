import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_schedule_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/sales_tax/sales_tax_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/resources/api_clients/api_client.dart';
import 'package:j3enterprise/src/resources/services/rest_api_service.dart';
import 'package:j3enterprise/src/resources/shared/function/update_backgroung_job_schedule_status.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:j3enterprise/src/resources/shared/utils/customer_date_json_serializer.dart';
import 'package:logging/logging.dart';

class SalesTaxRepository {
  var api = ApiClient.chopper.getService<RestApiService>();
  var db;

  late bool isStopped = false;

  static final _log = Logger('Sales Tax Repository');
  late UpdateBackgroundJobStatus updateBackgroundJobStatus;
  late BackgroundJobScheduleDao backgroundJobScheduleDao;
  late SalesTaxDao salesTaxDao;

  late UserSharedData userSharedData;

  SalesTaxRepository() {
    _log.finest("Sales repository constructer call");
    db = AppDatabase();
    updateBackgroundJobStatus = new UpdateBackgroundJobStatus();
    backgroundJobScheduleDao = new BackgroundJobScheduleDao(db);
    salesTaxDao = new SalesTaxDao(db);
    userSharedData = new UserSharedData();
  }

  Future<void> getSalesTaxFromServer(String jobName) async {
    try {
      //ToDo code review to get a better way to push bulk data to API and update bulk data in database
      _log.finest("Executing sales tax date from server");
      var isSchedulerEnable = await backgroundJobScheduleDao.getJob(jobName);
      _log.finest("Sales tax  job found in background Jobs scheduler");
      if (isSchedulerEnable.startDateTime.isBefore(DateTime.now())) {
        if (isSchedulerEnable.enableJob == true) {
          DateTime startDate = isSchedulerEnable.startDateTime;
          _log.finest("Sales tax  jobs start date is $startDate ");
          final Response response = await api.getAllIsalestax();
          _log.finest("Checking server resopnses for sales tax  ");
          Map<String, dynamic> map = json.decode(response.bodyString);
          if (response.isSuccessful && map['success']) {
            _log.finest("Server resopnses successful for sales tax ");
            Map<String, dynamic> result = map['result'];
            var items = (result['items'] as List).map((e) {
              return SalesTaxData.fromJson(e, serializer: CustomSerializer());
            });

            for (var item in items) {
              if (isStopped) break;
              await salesTaxDao.createOrUpdateSaleTax(item);
            }
            updateBackgroundJobStatus.updateJobStatus(jobName, "Success");
          } else {
            String error = map["error"]["details"].toString();
            updateBackgroundJobStatus.updateJobStatus(jobName, "Error");
            _log.shout(
                "Sales tax API call failed. Server respond with error : $error  ");
          }
        }
      }
    } catch (e) {
      updateBackgroundJobStatus.updateJobStatus(jobName, "Error");
      _log.shout(e, StackTrace.current);
    }
  }
}
