import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/items/category_model.dart';
import 'package:drift/drift.dart';

part 'category_crud.g.dart';

@DriftAccessor(tables: [Categores])
class CategoryDao extends DatabaseAccessor<MyDatabase> with _$CategoryDaoMixin {
  final MyDatabase db;

  CategoryDao(this.db) : super(db);

  Future<List<Categore>> getAllCategory() {
    return (select(db.categores).get());
  }

  Stream<List<Categore>> watchAllCategoryByName(String categoryName) {
    return (select(db.categores)..where((t) => t.category.equals(categoryName))).watch();
  }

  Future<List<Categore>> getAllCategoryByName(String categoryName) {
    return (select(db.categores)..where((t) => t.category.equals(categoryName))).get();
  }

  Future<void> createOrUpdateCateory(Categore categoryData) {
    return into(db.categores).insertOnConflictUpdate(categoryData);
  }

  Future deleteAllCategory() => delete(db.categores).go();
}
