import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/category_model.dart';


import 'package:moor/moor.dart';

part 'category_crud.g.dart';

@UseDao(tables: [Category])
class CategoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryDaoMixin {
  final AppDatabase db;
  CategoryDao(this.db) : super(db);

  
}
