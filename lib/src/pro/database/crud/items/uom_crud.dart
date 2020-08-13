import 'package:j3enterprise/src/database/moor_database.dart';

import 'package:j3enterprise/src/pro/models/items/stock_uom_model.dart';
import 'package:j3enterprise/src/pro/models/items/uom_model.dart';


import 'package:moor/moor.dart';

part 'uom_crud.g.dart';

@UseDao(tables: [UnitOfMeaseure])
class UnitOfMeaseureDao extends DatabaseAccessor<AppDatabase> with _$UnitOfMeaseureDaoMixin {
  final AppDatabase db;
  UnitOfMeaseureDao(this.db) : super(db);

  
}
