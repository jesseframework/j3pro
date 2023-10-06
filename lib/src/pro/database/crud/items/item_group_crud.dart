import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:drift/drift.dart';

part 'item_group_crud.g.dart';

@DriftAccessor(tables: [ItemGroup])
class ItemGroupDao extends DatabaseAccessor<MyDatabase> with _$ItemGroupDaoMixin {
  final MyDatabase db;
  ItemGroupDao(this.db) : super(db);

  Future<List<ItemGroup>> getAllItemGroup() {
    return (select(db.itemGroups).get());
  }

  Stream<List<ItemGroup>> watchAllItemGroupByName(String itemGroupName) {
    return (select(db.itemGroups)..where((t) => t.group.equals(itemGroupName))).watch();
  }

  Future<List<ItemGroup>> getAllItemGroupByName(String itemGroupName) {
    return (select(db.itemGroups)..where((t) => t.group.equals(itemGroupName))).get();
  }

  Future<void> createOrUpdateItemGroup(ItemGroup itemGroup) {
    return into(db.itemGroups).insertOnConflictUpdate(itemGroup);
  }

  Future deleteAllItemGroups() => delete(db.itemGroups).go();
}
