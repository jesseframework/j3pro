import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_header_model.dart';
import 'package:drift/drift.dart';

part 'sales_order_header_crud.g.dart';

@DriftAccessor(tables: [SalesOrderHeader])
class SalesOrderHeaderDao extends DatabaseAccessor<MyDatabase> with _$SalesOrderHeaderDaoMixin {
  final MyDatabase db;
  SalesOrderHeaderDao(this.db) : super(db);

  Future<List<SalesOrderHeaderData>> getAllSalesOrderHeader() {
    return (select(db.salesOrderHeader).get());
  }

  Future<List<SalesOrderHeaderData>> getSalesOrderHeaderBySaleOrderNo(String orderNo) {
    return (select(db.salesOrderHeader)..where((t) => t.transactionNumber.contains(orderNo))).get();
  }

  Stream<List<SalesOrderHeaderData>> watchAllSalesOrderHeader(String orderNo) {
    return (select(db.salesOrderHeader)..where((t) => t.transactionNumber.contains(orderNo))).watch();
  }

  Future insertSalesOrderHeader(SalesOrderHeaderData salesOrderHeaderData) => into(db.salesOrderHeader).insert(salesOrderHeaderData);

  Future tempInsertSalesOrderHeader(SalesOrderHeaderCompanion salesOrderHeaderCompanion) =>
      into(db.salesOrderHeader).insert(salesOrderHeaderCompanion);

  Future deleteAllSalesOrderHeader() => delete(db.salesOrderHeader).go();
}
