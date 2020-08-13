import 'package:j3enterprise/src/database/moor_database.dart';

import 'package:j3enterprise/src/pro/models/items/stock_uom_model.dart';


import 'package:moor/moor.dart';

part 'stock_uom_crud.g.dart';

@UseDao(tables: [StockUnitOfMeaseure])
class StockUnitOfMeaseureDao extends DatabaseAccessor<AppDatabase> with _$StockUnitOfMeaseureDaoMixin {
  final AppDatabase db;
  StockUnitOfMeaseureDao(this.db) : super(db);

  
}
