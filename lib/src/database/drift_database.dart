import 'dart:io';
import 'package:drift/drift.dart';
import 'package:j3enterprise/src/database/crud/application_logger/app_logger_crud.dart';
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
  Address,
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
