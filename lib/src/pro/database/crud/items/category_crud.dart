import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/category_model.dart';
import 'package:moor/moor.dart';

part 'category_crud.g.dart';

@UseDao(tables: [Category])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  final AppDatabase db;

  CategoryDao(this.db) : super(db);

  Future<List<CategoryData>> getAllCategory() {
    return (select(db.category).get());
  }

  Stream<List<CategoryData>> watchAllCategoryByName(String categoryName) {
    return (select(db.category)..where((t) => t.category.equals(categoryName)))
        .watch();
  }

  Future<List<CategoryData>> getAllCategoryByName(String categoryName) {
    return (select(db.category)..where((t) => t.category.equals(categoryName)))
        .get();
  }

  Future<void> createOrUpdateAddress(CategoryData categoryData) {
    return into(db.category).insertOnConflictUpdate(categoryData);
  }

  Future deleteAllCategory() => delete(db.category).go();
}
