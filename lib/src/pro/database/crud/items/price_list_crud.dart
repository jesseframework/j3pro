import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/item_pricing_rule_model.dart';
import 'package:j3enterprise/src/pro/models/items/price_list_model.dart';


import 'package:moor/moor.dart';

part 'price_list_crud.g.dart';

@UseDao(tables: [PriceList])
class PriceListDao extends DatabaseAccessor<AppDatabase> with _$PriceListDaoMixin {
  final AppDatabase db;
  PriceListDao(this.db) : super(db);

  
}
