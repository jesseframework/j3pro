import 'package:intl/intl.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/account/sales_tax/sales_tax_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;

class CalculateTax {
  late double lineTaxTotal;
  late double taxRate;
  late String taxIndicator;
  late String className = "calculate Taxs";
  var db;
  static final _log = Logger('CalcualteTax');

  //DAOs
  late ItemsDao itemsDao;
  late CustomerDao customerDao;
  late SalesOrderDetailTempDao salesOrderDetailTempDao;
  late SalesTaxDao salesTaxDao;
  late SystemCurrencyDao systemCurrencyDao;

  CalculateTax() {
    db = MyDatabase();
    _log.finest("$className repository constructer call");

    //DAOs in Constructure
    itemsDao = ItemsDao(db);
    salesOrderDetailTempDao = SalesOrderDetailTempDao(db);
    customerDao = CustomerDao(db);
    salesTaxDao = SalesTaxDao(db);
    systemCurrencyDao = SystemCurrencyDao(db);
  }
  Future<void> getTotalTax(
      String searchText,
      String transactionNumber,
      String transactionStatus,
      String salesUom,
      int tenantId,
      String userName,
      int userId,
      String itemId,
      String customerId,
      String taxGroup,
      DateTime salesDate,
      double lineSubTotal) async {
    var setTaxGroup =
        await salesTaxDao.getAllSalesTaxByGroup(taxGroup, salesDate);
    if (setTaxGroup.isNotEmpty) {
      _log.finest("Start Tax calculation");
      taxRate = setTaxGroup[0].accountRate!;
      taxGroup = setTaxGroup[0].taxAccount!;
      taxIndicator = setTaxGroup[0].taxIndicator!;

      if (taxRate > 0) {
        lineTaxTotal = taxRate / 100 * lineSubTotal;

        double formatedGrandTotal = 0;

        var currency =
            await systemCurrencyDao.getAllSystemCurrencyByName("JMD");
        if (currency.isNotEmpty) {
          var f = NumberFormat(currency[0].numberFormat, "en_US");
          formatedGrandTotal = double.tryParse(f.format(lineTaxTotal))!;
        } else {
          var f = NumberFormat("###.0#", "en_US");
          formatedGrandTotal = double.tryParse(f.format(lineTaxTotal))!;
        }

        var tax = SalesOrderDetailTempCompanion(
            taxTotal: moor.Value(formatedGrandTotal),
            taxGroup: moor.Value(taxGroup),
            taxIndicator: moor.Value(taxIndicator));

        await salesOrderDetailTempDao.updateLineTax(
            tax, transactionNumber, transactionStatus, itemId, salesUom);
      }
    }
  }
}
