import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_detail_temp_model.dart';
import 'package:drift/drift.dart';

part 'sales_order_detail_temp_crud.g.dart';

@DriftAccessor(tables: [SalesOrderDetailTemp])
class SalesOrderDetailTempDao extends DatabaseAccessor<MyDatabase> with _$SalesOrderDetailTempDaoMixin {
  final MyDatabase db;
  SalesOrderDetailTempDao(this.db) : super(db);

  Future updateCreateFullAudit(SalesOrderDetailTempCompanion sodtc, int id, String transactionNumber) {
    return (update(db.salesOrderDetailTemp)..where((t) => t.transactionNumber.equals(transactionNumber) & t.id.equals(id))).write(
      SalesOrderDetailTempCompanion(),
    );
  }

  Future<List<SalesOrderDetailTempData>> getAllSalesOrderDetail() {
    return (select(db.salesOrderDetailTemp).get());
  }

  Future<List<SalesOrderDetailTempData>> getAllSalesOrderForUpdate(
      String transactionNumber, String transactionStatus, String itemId, String salesUom) {
    return (select(db.salesOrderDetailTemp)
          ..where((t) =>
              t.transactionNumber.equals(transactionNumber) &
              t.transactionStatus.equals(transactionStatus) &
              t.itemId.equals(itemId) &
              t.salesUOM.equals(salesUom)))
        .get();
  }

  Future updateInvoiceTotal(
      SalesOrderDetailTempCompanion tempOrder, String transactionNumber, String transactionStatus, String itemId, String salesUom) {
    return (update(db.salesOrderDetailTemp)
          ..where((t) =>
              t.transactionNumber.equals(transactionNumber) &
              t.transactionStatus.equals(transactionStatus) &
              t.itemId.equals(itemId) &
              t.salesUOM.equals(salesUom)))
        .write(
      SalesOrderDetailTempCompanion(
          listPrice: tempOrder.listPrice,
          subTotal: tempOrder.subTotal,
          lineDiscountTotal: tempOrder.lineDiscountTotal,
          discountAmount: tempOrder.discountAmount,
          discountPercentage: tempOrder.discountPercentage),
    );
  }

  Future updateLineItem(SalesOrderDetailTempCompanion tempOrder, String transactionNumber, String transactionStatus, String itemId, String salesUom) {
    return (update(db.salesOrderDetailTemp)
          ..where((t) =>
              t.transactionNumber.equals(transactionNumber) &
              t.transactionStatus.equals(transactionStatus) &
              t.itemId.equals(itemId) &
              t.salesUOM.equals(salesUom)))
        .write(
      SalesOrderDetailTempCompanion(
          listPrice: tempOrder.listPrice, subTotal: tempOrder.subTotal, shippingTotal: tempOrder.shippingTotal, quantity: tempOrder.quantity),
    );
  }

  Future updateLineTax(SalesOrderDetailTempCompanion tax, String transactionNumber, String transactionStatus, String itemId, String salesUom) {
    return (update(db.salesOrderDetailTemp)
          ..where((t) =>
              t.transactionNumber.equals(transactionNumber) &
              t.transactionStatus.equals(transactionStatus) &
              t.itemId.equals(itemId) &
              t.salesUOM.equals(salesUom)))
        .write(
      SalesOrderDetailTempCompanion(
          taxTotal: tax.taxTotal, listPrice: tax.listPrice, taxGroup: tax.taxGroup, subTotal: tax.subTotal, taxIndicator: tax.taxIndicator),
    );
  }

  Future increaseLineItemQuantity(SalesOrderDetailTempData record) => update(salesOrderDetailTemp).replace(record);

  Future decreaseLineItemQuantity(
      SalesOrderDetailTempCompanion qty, String transactionNumber, String transactionStatus, String itemId, String salesUom) {
    return (update(db.salesOrderDetailTemp)
          ..where((t) =>
              t.transactionNumber.equals(transactionNumber) &
              t.transactionStatus.equals(transactionStatus) &
              t.itemId.equals(itemId) &
              t.salesUOM.equals(salesUom)))
        .write(
      SalesOrderDetailTempCompanion(
        quantity: qty.quantity,
      ),
    );
  }

  Stream<List<SalesOrderDetailTempData>> watchAllSalesOrderDetail(String transactionNumber, String transactionStatus) {
    return (select(db.salesOrderDetailTemp)
          ..orderBy([(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..where((t) => t.transactionNumber.equals(transactionNumber) & t.transactionStatus.equals(transactionStatus)))
        .watch();
  }

  Future<List<SalesOrderDetailTempData>> getAllSalesOrderDetailTemp(String transactionNumber, String transactionStatus) {
    return (select(db.salesOrderDetailTemp)
          ..orderBy([(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..where((t) => t.transactionNumber.equals(transactionNumber) & t.transactionStatus.equals(transactionStatus)))
        .get();
  }

  Future updateInvoiceGrandTotal(
      SalesOrderDetailTempCompanion tempOrder, String transactionNumber, String transactionStatus, String itemId, String salesUom) {
    return (update(db.salesOrderDetailTemp)
          ..where((t) =>
              t.transactionNumber.equals(transactionNumber) &
              t.transactionStatus.equals(transactionStatus) &
              t.itemId.equals(itemId) &
              t.salesUOM.equals(salesUom)))
        .write(
      SalesOrderDetailTempCompanion(grandTotal: tempOrder.grandTotal),
    );
  }

  Future insertSalesOrderDetail(SalesOrderDetailTempCompanion salesOrderDetailTempData) =>
      into(db.salesOrderDetailTemp).insert(salesOrderDetailTempData);

  Future deleteAllSalesOrderTempDetail() => delete(db.salesOrderDetailTemp).go();

  Future deleteLineItem(String itemId, String uom, String transactionNo, int lineId) {
    return (delete(db.salesOrderDetailTemp)
          ..where((t) => t.id.equals(lineId) & t.itemId.equals(itemId) & t.salesUOM.equals(uom) & t.transactionNumber.equals(transactionNo)))
        .go();
  }

  Future deleteLineItemAfterPost(String transactionNo) {
    return (delete(db.salesOrderDetailTemp)..where((t) => t.transactionNumber.equals(transactionNo))).go();
  }

  //This section calculate discount
  Stream<List<SalesOrderDetailTempData>> qtyOfItemOnRegister(String transactionNumber, String itemId, String uom, String transactionStatus) {
    return customSelect(
        'SELECT '
        ' Sum(quantity) as quantity, '
        ' Sum(sub_total) as sub_total, '
        ' transaction_number'
        ' FROM sales_order_detail_temp'
        ' where'
        ' transaction_number = ? '
        ' and item_id = ? '
        ' and sales_u_o_m = ? '
        ' and transaction_status = ? '
        ' group by'
        ' transaction_number;',
        readsFrom: {
          db.salesOrderDetailTemp
        },
        variables: [
          Variable.withString(transactionNumber),
          Variable.withString(itemId),
          Variable.withString(uom),
          Variable.withString(transactionStatus)
        ]
        // used for the stream: the stream will update when either table changes
        ).watch().map((rows) {
      return rows.map((row) => SalesOrderDetailTempData.fromJson(row.data)).toList();
    });
  }

  Stream<List<SalesOrderDetailTempData>> qtyOfItemGroupOnRegister(String transactionNumber, String itemGroup, String uom, String transactionStatus) {
    return customSelect(
        'SELECT '
        ' Sum(quantity) as quantity, '
        ' Sum(sub_total) as sub_total, '
        ' transaction_number'
        ' FROM sales_order_detail_temp'
        ' where'
        ' transaction_number = ? '
        ' and item_group = ? '
        ' and sales_u_o_m = ? '
        ' and transaction_status = ? '
        ' group by'
        ' transaction_number;',
        readsFrom: {
          db.salesOrderDetailTemp
        },
        variables: [
          Variable.withString(transactionNumber),
          Variable.withString(itemGroup),
          Variable.withString(uom),
          Variable.withString(transactionStatus)
        ]
        // used for the stream: the stream will update when either table changes
        ).watch().map((rows) {
      return rows.map((row) => SalesOrderDetailTempData.fromJson(row.data)).toList();
    });
  }

  Stream<List<SalesOrderDetailTempData>> qtyOfBrandOnRegister(String transactionNumber, String category, String uom, String transactionStatus) {
    return customSelect(
        'SELECT '
        ' Sum(quantity) as quantity, '
        ' Sum(sub_total) as sub_total, '
        ' transaction_number'
        ' FROM sales_order_detail_temp'
        ' where'
        ' transaction_number = ? '
        ' and category = ? '
        ' and sales_u_o_m = ? '
        ' and transaction_status = ? '
        ' group by'
        ' transaction_number;',
        readsFrom: {
          db.salesOrderDetailTemp
        },
        variables: [
          Variable.withString(transactionNumber),
          Variable.withString(category),
          Variable.withString(uom),
          Variable.withString(transactionStatus)
        ]
        // used for the stream: the stream will update when either table changes
        ).watch().map((rows) {
      return rows.map((row) => SalesOrderDetailTempData.fromJson(row.data)).toList();
    });
  }

  Stream<List<SalesOrderDetailTempData>> transactionTotal(String transactionNumber, String transactionStatus) {
    return customSelect(
        ' SELECT '
        ' sum(sub_total) as sub_total, '
        ' sum(tax_total) as tax_total, '
        ' sum(line_discount_total) as line_discount_total, '
        ' sum(shipping_total) as shipping_total, '
        ' sum(grand_total) as grand_total, '
        ' sum(deposit_total) as deposit_total, '
        ' count(*) as item_count, '
        ' transaction_number '
        ' FROM '
        ' sales_order_detail_temp '
        ' WHERE transaction_number = ? '
        ' AND transaction_status = ? '
        ' GROUP BY '
        ' transaction_number ',
        readsFrom: {db.salesOrderDetailTemp},
        variables: [Variable.withString(transactionNumber), Variable.withString(transactionStatus)]
        // used for the stream: the stream will update when either table changes
        ).watch().map((rows) {
      return rows.map((row) => SalesOrderDetailTempData.fromJson(row.data)).toList();
    });
  }
}
