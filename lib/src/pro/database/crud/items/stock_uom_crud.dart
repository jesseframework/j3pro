import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/items/stock_uom_model.dart';
import 'package:drift/drift.dart';

part 'stock_uom_crud.g.dart';

@DriftAccessor(tables: [StockUnitOfMeasure])
class StockUnitOfMeasureDao extends DatabaseAccessor<MyDatabase> with _$StockUnitOfMeasureDaoMixin {
  final MyDatabase db;
  StockUnitOfMeasureDao(this.db) : super(db);

  Future<List<StockUnitOfMeasureData>> getAllStockUnitOfMeasureData() {
    return (select(db.stockUnitOfMeasure).get());
  }

  Stream<List<StockUnitOfMeasureData>> watchAllStockUnitOfMeasureByUOM(String uom) {
    return (select(db.stockUnitOfMeasure)..where((t) => t.uom.equals(uom))).watch();
  }

  Future<List<StockUnitOfMeasureData>> getAllStockUnitOfMeasureByUOM(String uom) {
    return (select(db.stockUnitOfMeasure)..where((t) => t.uom.equals(uom))).get();
  }

  Future<void> createOrUpdateUOM(StockUnitOfMeasureData stockUnitOfMeasureData) {
    return into(db.stockUnitOfMeasure).insertOnConflictUpdate(stockUnitOfMeasureData);
  }

  Future deleteAllStockUnitOfMeasure() => delete(db.stockUnitOfMeasure).go();
}
