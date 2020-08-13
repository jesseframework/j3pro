import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/customer/address_model.dart';


import 'package:moor/moor.dart';

part 'address_crud.g.dart';

@UseDao(tables: [Address])
class AddressDao extends DatabaseAccessor<AppDatabase> with _$AddressDaoMixin {
  final AppDatabase db;
  AddressDao(this.db) : super(db);

  
}
