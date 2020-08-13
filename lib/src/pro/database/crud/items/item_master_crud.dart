import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/category_model.dart';
import 'package:j3enterprise/src/pro/models/items/item_master_model.dart';


import 'package:moor/moor.dart';

part 'item_master_crud.g.dart';

@UseDao(tables: [Items])
class ItemsDao extends DatabaseAccessor<AppDatabase> with _$ItemsDaoMixin {
  final AppDatabase db;
  ItemsDao(this.db) : super(db);

  
}
