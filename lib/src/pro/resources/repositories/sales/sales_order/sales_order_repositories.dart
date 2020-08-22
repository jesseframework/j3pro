import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_schedule_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/uom_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_header_crud.dart';
import 'package:j3enterprise/src/resources/api_clients/api_client.dart';
import 'package:j3enterprise/src/resources/services/rest_api_service.dart';
import 'package:j3enterprise/src/resources/shared/function/update_backgroung_job_schedule_status.dart';
import 'package:j3enterprise/src/resources/shared/preferences/user_share_data.dart';
import 'package:j3enterprise/src/resources/shared/utils/customer_date_json_serializer.dart';
import 'package:logging/logging.dart';

class SaleOrderRepository {
  var api = ApiClient.chopper.getService<RestApiService>();
  var db;

  bool isStopped = false;

  static final _log = Logger('JourneyPlanRepository');
  UpdateBackgroundJobStatus updateBackgroundJobStatus;
  BackgroundJobScheduleDao backgroundJobScheduleDao;
  SalesOrderHeaderDao salesOrderHeaderDao;
  SalesOrderDetailDao salesOrderDetailDao;

  UserSharedData userSharedData;

  SaleOrderRepository() {
    _log.finest("Preference repository constructer call");
    db = AppDatabase();
    updateBackgroundJobStatus = new UpdateBackgroundJobStatus();
    backgroundJobScheduleDao = new BackgroundJobScheduleDao(db);
    salesOrderHeaderDao = new SalesOrderHeaderDao(db);
    salesOrderDetailDao = new SalesOrderDetailDao(db);
    userSharedData = new UserSharedData();
  }

  Future<void> uploadSalesOrderHeaderServer(String jobName) async {
    try {
      String className = "Sales Order Header";
      //ToDo code review to get a better way to push bulk data to API and update bulk data in database
      _log.finest("Executing $className date from server");
      var isSchedulerEnable = await backgroundJobScheduleDao.getJob(jobName);
      if (isSchedulerEnable != null) {
        _log.finest("$className job found in background Jobs scheduler");
        if (isSchedulerEnable.startDateTime.isBefore(DateTime.now())) {
          if (isSchedulerEnable.enableJob == true) {
            DateTime startDate = isSchedulerEnable.startDateTime;
            _log.finest("$className jobs start date is $startDate ");
            final Response response = await api.getAllPricingRule();
            _log.finest("Checking server resopnses for $className");
            Map<String, dynamic> map = json.decode(response.bodyString);
            if (response.isSuccessful && map['success']) {
              _log.finest("Server resopnses successful for $className ");
              Map<String, dynamic> result = map['result'];
              var items = (result['items'] as List).map((e) {
                return JourneyPlanData.fromJson(e,
                    serializer: CustomSerializer());
              });

              for (var item in items) {
                if (isStopped) break;
                //await journeyPlanDao.createOrUpdateJourneyPlan(item);
              }
              updateBackgroundJobStatus.updateJobStatus(jobName, "Success");
            } else {
              String error = map["error"]["details"].toString();
              updateBackgroundJobStatus.updateJobStatus(jobName, "Error");
              _log.shout(
                  "Customer API call failed. Server respond with error : $error  ");
            }
          }
        }
      }
    } catch (e) {
      updateBackgroundJobStatus.updateJobStatus(jobName, "Error");
      _log.shout(e, StackTrace.current);
    }
  }
}
