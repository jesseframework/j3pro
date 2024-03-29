import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/customer/customer_master_model.dart';
import 'package:drift/drift.dart';

part 'customer_crud.g.dart';

@DriftAccessor(tables: [Customer])
class CustomerDao extends DatabaseAccessor<MyDatabase> with _$CustomerDaoMixin {
  final MyDatabase db;
  CustomerDao(this.db) : super(db);

  Future<List<CustomerData>> getAllCustomer() {
    return (select(db.customer).get());
  }

  Stream<List<CustomerData>> watchAllCustomerById(String customerId) {
    return (select(db.customer)..where((t) => t.customerId.equals(customerId))).watch();
  }

  Future<List<CustomerData>> getAllCustomerById(String customerId) {
    return (select(db.customer)..where((t) => t.customerId.equals(customerId))).get();
  }

  Future<void> createOrUpdateByCustomer(CustomerData customerData) {
    return into(db.customer).insertOnConflictUpdate(customerData);
  }

  Future deleteAllCustomer() => delete(db.customer).go();
}
