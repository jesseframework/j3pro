
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order/sales_order_header_model.dart';

import 'package:moor/moor.dart';

part 'sales_order_crud.g.dart';

@UseDao(tables: [SalesOrderHeader])
class SalesOrderHeaderDao extends DatabaseAccessor<AppDatabase> with _$SalesOrderHeaderDaoMixin {
  final AppDatabase db;
  SalesOrderHeaderDao(this.db) : super(db);

  Future<List<DesktopData>> getAllDesktop() {
    return (select(db.desktop).get());
  }

   Future<void> createOrUpdatePref(DesktopData desktopData) {
    return into(db.desktop).insertOnConflictUpdate(desktopData);
  }

  Stream<List<DesktopData>> watchAllBusinessRule(String functionName) {
    return (select(db.desktop)..where((t) => t.iconName.contains(functionName))).watch();
  }

  Future insertBusinessRule(DesktopData desktopData) =>
      into(db.desktop).insert(desktopData);

  Future deleteAllBusinessRule() => delete(db.desktop).go();


}
