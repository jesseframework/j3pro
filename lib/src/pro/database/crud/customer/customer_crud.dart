import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/customer/customer_master_model.dart';


import 'package:moor/moor.dart';

part 'customer_crud.g.dart';

@UseDao(tables: [Customer])
class CustomerDao extends DatabaseAccessor<AppDatabase> with _$CustomerDaoMixin {
  final AppDatabase db;
  CustomerDao(this.db) : super(db);

  
}
