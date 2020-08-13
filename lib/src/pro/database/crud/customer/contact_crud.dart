import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/customer/contact_model.dart';


import 'package:moor/moor.dart';

part 'contact_crud.g.dart';

@UseDao(tables: [Contact])
class ContactDao extends DatabaseAccessor<AppDatabase> with _$ContactDaoMixin {
  final AppDatabase db;
  ContactDao(this.db) : super(db);

  
}
