import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_detail_model.dart';
import 'package:moor/moor.dart';

part 'sales_order_detail_crud.g.dart';

@UseDao(tables: [SalesOrderDetail])
class SalesOrderDetailDao extends DatabaseAccessor<AppDatabase>
    with _$SalesOrderDetailDaoMixin {
  final AppDatabase db;
  SalesOrderDetailDao(this.db) : super(db);

  Future<List<SalesOrderDetailData>> getAllSalesOrderDetail() {
    return (select(db.salesOrderDetail).get());
  }

  Stream<List<SalesOrderDetailData>> watchAllSalesOrderDetail(String orderNo) {
    return (select(db.salesOrderDetail)
          ..where((t) => t.transactionNumber.contains(orderNo)))
        .watch();
  }

  Future insertSalesOrderDetail(SalesOrderDetailData salesOrderDetailData) =>
      into(db.salesOrderDetail).insert(salesOrderDetailData);

  Future deleteAllSalesOrderDetail() => delete(db.salesOrderDetail).go();

  Future postSalesOrderData(SalesOrderDetailCompanion salesOrderDetailCompanion,
      SalesOrderHeaderCompanion salesOrderHeaderCompanion) {
    return transaction(() async {
      await into(db.salesOrderDetail).insert(salesOrderDetailCompanion);
      await into(db.salesOrderHeader).insert(salesOrderHeaderCompanion);
    });
  }
}
