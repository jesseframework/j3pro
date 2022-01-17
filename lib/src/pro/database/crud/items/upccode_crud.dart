import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/upc_code_model.dart';
import 'package:drift/drift.dart';

part 'upccode_crud.g.dart';

@DriftAccessor(tables: [UPCCode])
class UPCCodeDao extends DatabaseAccessor<AppDatabase> with _$UPCCodeDaoMixin {
  final AppDatabase db;
  UPCCodeDao(this.db) : super(db);

  Future<List<UPCCodeData>> getAllUPCCodeData() {
    return (select(db.uPCCode).get());
  }

  Stream<List<UPCCodeData>> watchAllUPCCodeByUPC(String upcCode) {
    return (select(db.uPCCode)..where((t) => t.upcCode.equals(upcCode)))
        .watch();
  }

  Future<List<UPCCodeData>> getAllUPCCodeByUPC(String upcCode) {
    return (select(db.uPCCode)..where((t) => t.upcCode.equals(upcCode))).get();
  }

  Future<void> createOrUpdateUPC(UPCCodeData upcCodeData) {
    return into(db.uPCCode).insertOnConflictUpdate(upcCodeData);
  }

  Future deleteAllUPCCode() => delete(db.uPCCode).go();
}
