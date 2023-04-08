import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/items/uom_model.dart';
import 'package:drift/drift.dart';

part 'uom_crud.g.dart';

@DriftAccessor(tables: [UnitOfMeasure])
class UnitOfMeasureDao extends DatabaseAccessor<MyDatabase> with _$UnitOfMeasureDaoMixin {
  final MyDatabase db;
  UnitOfMeasureDao(this.db) : super(db);

  Future<List<UnitOfMeasureData>> getAllUnitOfMeasureData() {
    return (select(db.unitOfMeasure).get());
  }

  Stream<List<UnitOfMeasureData>> watchAllUnitOfMeasureByUOM(String uom) {
    return (select(db.unitOfMeasure)..where((t) => t.uom.equals(uom))).watch();
  }

  Future<List<UnitOfMeasureData>> getAllUnitOfMeasureByUOM(String uom) {
    return (select(db.unitOfMeasure)..where((t) => t.uom.equals(uom))).get();
  }

  Future<void> createOrUpdateUOM(UnitOfMeasureData unitOfMeasureData) {
    return into(db.unitOfMeasure).insertOnConflictUpdate(unitOfMeasureData);
  }

  Future deleteAllUnitOfMeasure() => delete(db.unitOfMeasure).go();
}
