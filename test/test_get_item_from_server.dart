import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';

void main() {
  test('test get item from server', () async {
    var db;
    db = MyDatabase();
    ItemsDao itemsDao = new ItemsDao(db);
    var ng = await itemsDao.getAllItem();

    print(ng.single.description);

    expect(ng.single.description, ng.single.description);
  });
}
