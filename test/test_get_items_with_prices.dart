import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';
import 'package:j3enterprise/src/pro/models/items/ItemsWithPrices.dart';

void main() {
  test('test get item price from server', () async {
    var db;
    db = MyDatabase();
    String itemCode = "Kid";
    String itemId = "0";
    List<ItemsWithPrices> result = <ItemsWithPrices>[];

    ItemsDao items = new ItemsDao(db);
    items.watchitemsWithprices(itemCode).listen((e) {
      result = e;
      //print(result.length.toString());
      itemId = result.single.price.itemId;
      //print(result.length.toString());
      //result.map((e) => print(e.item.id));
      //yprint(e.single.price.itemPrice);
    });

    print('$itemId');

    //expect(result.length, result.length);
  });
}
