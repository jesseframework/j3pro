import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_detail_temp_model.dart';
import 'package:moor/moor.dart';

part 'sales_order_detail_temp_crud.g.dart';

@UseDao(tables: [SalesOrderDetailTemp])
class SalesOrderDetailTempDao extends DatabaseAccessor<AppDatabase>
    with _$SalesOrderDetailTempDaoMixin {
  final AppDatabase db;
  SalesOrderDetailTempDao(this.db) : super(db);

  Future<List<SalesOrderDetailTempData>> getAllSalesOrderDetail() {
    return (select(db.salesOrderDetailTemp).get());
  }

  Stream<List<SalesOrderDetailTempData>> watchAllSalesOrderDetail(
      String orderNo) {
    return (select(db.salesOrderDetailTemp)
          ..where((t) => t.transactionNumber.contains(orderNo)))
        .watch();
  }

  Future insertSalesOrderDetail(
          SalesOrderDetailTempData salesOrderDetailTempData) =>
      into(db.salesOrderDetailTemp).insert(salesOrderDetailTempData);

  Future deleteAllSalesOrderTempDetail() =>
      delete(db.salesOrderDetailTemp).go();

  //This section calculate discount
  Stream<List<SalesOrderDetailTempData>> qtyOfItemOnRegister(
      String transactionNumber,
      int itemId,
      String uom,
      String transactionStatus) {
    return customSelect(
      'SELECT '
      'Sum(quantity) as quantity, '
      'Sum(subtotal) as subtotal,'
      'transaction_number,'
      'FROM sales_order_detail_temp'
      'where'
      'transaction_number = $transactionNumber'
      'and item_id = $itemId'
      'and uom = $uom'
      'and transaction_status = $transactionStatus'
      'group by'
      'transaction_number,',
      readsFrom: {
        db.salesOrderDetailTemp
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) {
      return rows
          .map((row) => SalesOrderDetailTempData.fromData(row.data, db))
          .toList();
    });
  }

  Stream<List<SalesOrderDetailTempData>> qtyOfItemGroupOnRegister(
      String transactionNumber,
      String itemGroup,
      String uom,
      String transactionStatus) {
    return customSelect(
      'SELECT '
      'Sum(quantity) as quantity, '
      'Sum(subtotal) as subtotal,'
      'transaction_number,'
      'FROM sales_order_detail_temp'
      'where'
      'transaction_number = $transactionNumber'
      'and item_group = $itemGroup'
      'and uom = $uom'
      'and transaction_status = $transactionStatus'
      'group by'
      'transaction_number,',
      readsFrom: {
        db.salesOrderDetailTemp
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) {
      return rows
          .map((row) => SalesOrderDetailTempData.fromData(row.data, db))
          .toList();
    });
  }

  Stream<List<SalesOrderDetailTempData>> qtyOfBrandOnRegister(
      String transactionNumber,
      String category,
      String uom,
      String transactionStatus) {
    return customSelect(
      'SELECT '
      'Sum(quantity) as quantity, '
      'Sum(subtotal) as subtotal,'
      'transaction_number,'
      'FROM sales_order_detail_temp'
      'where'
      'transaction_number = $transactionNumber'
      'and category = $category'
      'and uom = $uom'
      'and transaction_status = $transactionStatus'
      'group by'
      'transaction_number,',
      readsFrom: {
        db.salesOrderDetailTemp
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) {
      return rows
          .map((row) => SalesOrderDetailTempData.fromData(row.data, db))
          .toList();
    });
  }

  Stream<List<SalesOrderDetailTempData>> qtyOfAllItemsOnRegister(
      String transactionNumber,
      int itemId,
      String uom,
      String transactionStatus) {
    return customSelect(
      'SELECT '
      'Sum(quantity) as quantity, '
      'Sum(subtotal) as subtotal,'
      'transaction_number,'
      'FROM sales_order_detail_temp'
      'WHERE'
      'transaction_number = $transactionNumber'
      'and item_id = $itemId'
      'and uom = $uom'
      'and transaction_status = $transactionStatus'
      'group by'
      'transaction_number,',
      readsFrom: {
        db.salesOrderDetailTemp
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) {
      return rows
          .map((row) => SalesOrderDetailTempData.fromData(row.data, db))
          .toList();
    });
  }
}
