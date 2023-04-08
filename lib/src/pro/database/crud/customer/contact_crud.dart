import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/customer/contact_model.dart';
import 'package:drift/drift.dart';

part 'contact_crud.g.dart';

@DriftAccessor(tables: [Contact])
class ContactDao extends DatabaseAccessor<MyDatabase> with _$ContactDaoMixin {
  final MyDatabase db;
  ContactDao(this.db) : super(db);
  Future<List<ContactData>> getAllContact() {
    return (select(db.contact).get());
  }

  Stream<List<ContactData>> watchAllContactByTitle(String contactTitle) {
    return (select(db.contact)..where((t) => t.contactTitle.equals(contactTitle))).watch();
  }

  Future<List<ContactData>> getAllContactByTitle(String contactTitle) {
    return (select(db.contact)..where((t) => t.contactTitle.equals(contactTitle))).get();
  }

  Future<void> createOrUpdateAddress(ContactData contactData) {
    return into(db.contact).insertOnConflictUpdate(contactData);
  }

  Future deleteAllContact() => delete(db.contact).go();
}
