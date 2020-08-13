import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/item_prices_model.dart';


import 'package:moor/moor.dart';

part 'item_price_crud.g.dart';

@UseDao(tables: [ItemPrice])
class ItemPriceDao extends DatabaseAccessor<AppDatabase> with _$ItemPriceDaoMixin {
  final AppDatabase db;
  ItemPriceDao(this.db) : super(db);

  
}
