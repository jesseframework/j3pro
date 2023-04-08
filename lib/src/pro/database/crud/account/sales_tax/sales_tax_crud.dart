
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/account/sales_tax/sales_tax_model.dart';

import 'package:drift/drift.dart';

part 'sales_tax_crud.g.dart';

@DriftAccessor(tables: [SalesTax])
class SalesTaxDao extends DatabaseAccessor<MyDatabase>
    with _$SalesTaxDaoMixin {
  final MyDatabase db;
  SalesTaxDao(this.db) : super(db);

  Future<List<SalesTaxData>> getAllSalesTax() {
    return (select(db.salesTax).get());
  }

  Future<List<SalesTaxData>> getAllSalesTaxByGroup(
      String taxGroup, DateTime salesDate) {
    return (select(db.salesTax)
          ..where((t) =>
              t.taxAccount.equals(taxGroup) &
              t.effectiveDate.isSmallerOrEqualValue(salesDate)))
        .get();
  }

  Future<void> createOrUpdateSaleTax(SalesTaxData salesTaxData) {
    return into(db.salesTax).insertOnConflictUpdate(salesTaxData);
  }
}
