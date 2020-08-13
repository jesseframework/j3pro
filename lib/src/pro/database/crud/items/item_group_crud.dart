import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/category_model.dart';


import 'package:moor/moor.dart';

part 'item_group_crud.g.dart';

@UseDao(tables: [ItemGroup])
class ItemGroupDao extends DatabaseAccessor<AppDatabase> with _$ItemGroupDaoMixin {
  final AppDatabase db;
  ItemGroupDao(this.db) : super(db);

  
}
