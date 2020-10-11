import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/account/sales_tax/sales_tax_model.dart';
import 'package:j3enterprise/src/pro/models/series_number/series_number_model.dart';

import 'package:moor/moor.dart';

part 'sales_tax_crud.g.dart';

@UseDao(tables: [SalesTax])
class SalesTaxDao extends DatabaseAccessor<AppDatabase>
    with _$SalesTaxDaoMixin {
  final AppDatabase db;
  SalesTaxDao(this.db) : super(db);

  Future<List<SalesTaxData>> getAllSalesTax() {
    return (select(db.salesTax).get());
  }

  Future<List<SalesTaxData>> getAllSalesTaxByGroup(String taxGroup) {
    return (select(db.salesTax)..where((t) => t.taxAccount.equals(taxGroup)))
        .get();
  }
}
