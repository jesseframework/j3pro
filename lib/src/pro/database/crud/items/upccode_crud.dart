import 'package:j3enterprise/src/database/moor_database.dart';

import 'package:j3enterprise/src/pro/models/items/upc_code_model.dart';

import 'package:moor/moor.dart';

part 'upccode_crud.g.dart';

@UseDao(tables: [UPCCode])
class UPCCodeDao extends DatabaseAccessor<AppDatabase> with _$UPCCodeDaoMixin {
  final AppDatabase db;
  UPCCodeDao(this.db) : super(db);

  //This is a test;
}
