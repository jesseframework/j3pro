import 'dart:io';
import 'package:drift/drift.dart';
import 'package:j3enterprise/src/resources/shared/utils/date_formating.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:j3enterprise/src/models/application_logger_model.dart';
import 'package:j3enterprise/src/models/background_job_schedule_model.dart';
import 'package:j3enterprise/src/models/background_jobs_logs_model.dart';
import 'package:j3enterprise/src/models/business_rule_model.dart';
import 'package:j3enterprise/src/models/communication_model.dart';
import 'package:j3enterprise/src/models/desktop_model.dart';
import 'package:j3enterprise/src/models/mobile_device_model.dart';
import 'package:j3enterprise/src/models/non_global_business_rule.dart';
import 'package:j3enterprise/src/models/non_global_preference_setting.dart';
import 'package:j3enterprise/src/models/preference_model.dart';
import 'package:j3enterprise/src/models/tenant_model.dart';
import 'package:j3enterprise/src/models/user_model.dart';
import 'package:j3enterprise/src/pro/models/account/currency/currency_model.dart';
import 'package:j3enterprise/src/pro/models/account/exchange_rate/exchange_rate_model.dart';
import 'package:j3enterprise/src/pro/models/account/sales_tax/sales_tax_model.dart';
import 'package:j3enterprise/src/pro/models/clock/clock_in_model.dart';
import 'package:j3enterprise/src/pro/models/clock/money_deposit_model.dart';
import 'package:j3enterprise/src/pro/models/customer/address_model.dart';
import 'package:j3enterprise/src/pro/models/customer/contact_model.dart';
import 'package:j3enterprise/src/pro/models/customer/customer_master_model.dart';
import 'package:j3enterprise/src/pro/models/items/category_model.dart';
import 'package:j3enterprise/src/pro/models/items/item_group_model.dart';
import 'package:j3enterprise/src/pro/models/items/item_master_model.dart';
import 'package:j3enterprise/src/pro/models/items/item_prices_model.dart';
import 'package:j3enterprise/src/pro/models/items/item_pricing_rule_model.dart';
import 'package:j3enterprise/src/pro/models/items/price_list_model.dart';
import 'package:j3enterprise/src/pro/models/items/stock_uom_model.dart';
import 'package:j3enterprise/src/pro/models/items/uom_model.dart';
import 'package:j3enterprise/src/pro/models/items/upc_code_model.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/journey_plan.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_detail_model.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_detail_temp_model.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_header_model.dart';
import 'package:j3enterprise/src/pro/models/series_number/series_number_model.dart';
import 'package:j3enterprise/src/pro/models/series_number/temp_number_logs.dart';
import 'package:j3enterprise/src/pro/models/warehouse/inventory_items_model.dart';
import 'package:j3enterprise/src/pro/models/warehouse/inventory_transaction_model.dart';
 

part 'drift_database.g.dart';

@DriftDatabase(tables: [
  Users,
  Communication,
  BackgroundJobSchedule,
  BackgroundJobLogs,
  Preference,
  MobileDevice,
  BusinessRule,
  NonGlobalBusinessRule,
  ApplicationLogger,
  Tenant,
  NonGlobalPreference,
  Desktop,
  SalesOrderHeader,
  SalesOrderDetail,
  SalesOrderDetailTemp,
  SeriesNumberGenerator,
  SalesTax,
  TempNumberLogs,
  Customer,
  Addres,
  Contact,
  Items,
  ItemsPrices,
  ItemPricingRule,
  Categores,
  ItemGroups,
  PriceList,
  UnitOfMeasure,
  StockUnitOfMeasure,
  JourneyPlan,
  UPCCode,
  InventoryItems,
  InventoryTransaction,
  MoneyDeposit,
  ClockIn,
  SystemCurrency,
  ExchangeRate
],)  
 
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  // MyDatabase() : super(_openConnection());

  static final MyDatabase instance = MyDatabase._internal(_openConnection());
  factory MyDatabase() {
    return instance;
  }
  MyDatabase._internal(QueryExecutor e) : super(e);

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
             String systemDate = await formatDate(DateTime.now().toString());
          await into(backgroundJobSchedule).insert(BackgroundJobScheduleData(
              id: 1,
              jobName: "Mobile Desktop",
              startDateTime: DateTime.tryParse(systemDate)!,
              syncFrequency: "Every 20 Minutes",
              enableJob: true,
              lastRun: DateTime.tryParse(systemDate)!,
              jobStatus: "Never Run"));
          await into(backgroundJobSchedule).insert(BackgroundJobScheduleData(
              id: 2,
              jobName: "Configuration",
              startDateTime: DateTime.tryParse(systemDate)!,
              syncFrequency: "Every 20 Minutes",
              enableJob: true,
              lastRun: DateTime.tryParse(systemDate)!,
              jobStatus: "Never Run"));
          await into(backgroundJobSchedule).insert(BackgroundJobScheduleData(
              id: 3,
              jobName: "Log Shipping",
              startDateTime: DateTime.tryParse(systemDate)!,
              syncFrequency: "Every Day",
              enableJob: true,
              lastRun: DateTime.tryParse(systemDate)!,
              jobStatus: "Never Run"));

          await into(seriesNumberGenerator).insert(SeriesNumberGeneratorData(
              id: 1,
              includeJulianDate: false,
              includePrefix: false,
              includeUserID: false,
              includeTenantId: false,
              usedAutoNumber: false,
              numberPrefix: "SO",
              endingLength: 8,
              typeOfNumber: "Sales Order"));
          await into(seriesNumberGenerator).insert(SeriesNumberGeneratorData(
              id: 2,
              includeJulianDate: false,
              includePrefix: false,
              includeUserID: false,
              includeTenantId: false,
              usedAutoNumber: false,
              numberPrefix: "INV",
              endingLength: 8,
              typeOfNumber: "Invoice"));

          await into(tempNumberLogs).insert(TempNumberLog(
              id: 1,
              lastUsageDate: DateTime.now(),
              tenantId: '1',
              nextSeriesNumber: "SO10000000001",
              lastSeriesNumber: "SO10000000002",
              typeOfNumber: "Sales Order"));
          await into(tempNumberLogs).insert(TempNumberLog(
              id: 2,
              lastUsageDate: DateTime.now(),
              tenantId: '1',
              nextSeriesNumber: "CLI10000000001",
              lastSeriesNumber: "CLI10000000002",
              typeOfNumber: "Clock In"));
          await into(tempNumberLogs).insert(TempNumberLog(
              id: 3,
              lastUsageDate: DateTime.now(),
              tenantId: '1',
              nextSeriesNumber: "CLO10000000001",
              lastSeriesNumber: "CLO10000000002",
              typeOfNumber: "Clock Out"));
          await into(tempNumberLogs).insert(TempNumberLog(
              id: 4,
              lastUsageDate: DateTime.now(),
              tenantId: '1',
              nextSeriesNumber: "INV10000000001",
              lastSeriesNumber: "INV10000000002",
              typeOfNumber: "Invoice"));

          await into(tempNumberLogs).insert(TempNumberLog(
              id: 5,
              lastUsageDate: DateTime.now(),
              tenantId: '1',
              nextSeriesNumber: "INC10000000001",
              lastSeriesNumber: "INC10000000001",
              typeOfNumber: "Inventory Cycle"));
        },
      );
 
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
   
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'meter.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
