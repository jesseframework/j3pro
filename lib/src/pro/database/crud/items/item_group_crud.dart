import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:moor/moor.dart';

part 'item_group_crud.g.dart';

@UseDao(tables: [ItemGroup])
class ItemGroupDao extends DatabaseAccessor<AppDatabase>
    with _$ItemGroupDaoMixin {
  final AppDatabase db;
  ItemGroupDao(this.db) : super(db);

  Future<List<ItemGroup>> getAllItemGroup() {
    return (select(db.itemGroups).get());
  }

  Stream<List<ItemGroup>> watchAllItemGroupByName(String itemGroupName) {
    return (select(db.itemGroups)..where((t) => t.group.equals(itemGroupName)))
        .watch();
  }

  Future<List<ItemGroup>> getAllItemGroupByName(String itemGroupName) {
    return (select(db.itemGroups)..where((t) => t.group.equals(itemGroupName)))
        .get();
  }

  Future<void> createOrUpdateItemGroup(ItemGroup itemGroup) {
    return into(db.itemGroups).insertOnConflictUpdate(itemGroup);
  }

  Future deleteAllItemGroups() => delete(db.itemGroups).go();
}
