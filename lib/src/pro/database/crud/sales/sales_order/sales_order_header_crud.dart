import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_header_model.dart';
import 'package:moor/moor.dart';

part 'sales_order_header_crud.g.dart';

@UseDao(tables: [SalesOrderHeader])
class SalesOrderHeaderDao extends DatabaseAccessor<AppDatabase>
    with _$SalesOrderHeaderDaoMixin {
  final AppDatabase db;
  SalesOrderHeaderDao(this.db) : super(db);

  Future<List<SalesOrderHeaderData>> getAllSalesOrderHeader() {
    return (select(db.salesOrderHeader).get());
  }

  Stream<List<SalesOrderHeaderData>> watchAllSalesOrderHeader(String orderNo) {
    return (select(db.salesOrderHeader)
          ..where((t) => t.transactionNumber.contains(orderNo)))
        .watch();
  }

  Future insertSalesOrderHeader(SalesOrderHeaderData salesOrderHeaderData) =>
      into(db.salesOrderHeader).insert(salesOrderHeaderData);

  Future deleteAllSalesOrderHeader() => delete(db.salesOrderHeader).go();
}
