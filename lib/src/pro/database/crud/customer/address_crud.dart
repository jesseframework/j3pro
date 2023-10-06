import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/customer/address_model.dart';
import 'package:drift/drift.dart';

part 'address_crud.g.dart';

@DriftAccessor(tables: [Address])
class AddressDao extends DatabaseAccessor<MyDatabase> with _$AddressDaoMixin {
  final MyDatabase db;
  AddressDao(this.db) : super(db);

  Future<List<Addres>> getAllAddress() {
    return (select(db.address).get());
  }

  Stream<List<Addres>> watchAllAddressByTitle({String? customerId, bool? isShippingAddress, bool? isDisable}) {
    return (select(db.address)
          ..where((t) => t.customerId.equals(customerId!) & t.isShippingAddress.equals(isShippingAddress!) & t.isDeleted.equals(isDisable!)))
        .watch();
  }

  Stream<List<Addres>> watchAllAddressByTitleDual({String? customerId, String? addressType, bool? isDisable}) {
    return (select(db.address)..where((t) => t.customerId.equals(customerId!) & t.isDeleted.equals(isDisable!))).watch();
  }

  Future<List<Addres>> getAllAddressByTitle(String customerId) {
    return (select(db.address)..where((t) => t.customerId.equals(customerId) & t.latitude.isBiggerThanValue(0) & t.longitude.isSmallerThanValue(0)))
        .get();
  }

  Future<void> createOrUpdateAddress(Addres address) {
    return into(db.address).insertOnConflictUpdate(address);
  }

  Future deleteAllSeriesNumberGenerator() => delete(db.seriesNumberGenerator).go();
}
