import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';

void main() {
  test('test get item price from server', () async {
    MyDatabase db;
    db = MyDatabase();
    String itemCode = "19";
    String uom = "";
    String priceList = "";
    String standardPriceList = "Standard Price List";
    ItemPriceDao itemPriceDao = ItemPriceDao(db);
    var ng = await itemPriceDao.getItemPricesByCode(
        itemCode, uom, priceList, standardPriceList);

    print(ng.single.itemCode);
    print(ng.single.itemPrice);

    expect(ng.single.itemCode, ng.single.itemCode);
  });
}
