import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/customer/address_model.dart';
import 'package:drift/drift.dart';

part 'address_crud.g.dart';

@DriftAccessor(tables: [Addres])
class AddressDao extends DatabaseAccessor<MyDatabase> with _$AddressDaoMixin {
  final MyDatabase db;
  AddressDao(this.db) : super(db);

  Future<List<Addre>> getAllAddress() {
    return (select(db.addres).get());
  }

  Stream<List<Addre>> watchAllAddressByTitle({String? customerId, bool? isShippingAddress, bool? isDisable}) {
    return (select(db.addres)
          ..where((t) => t.customerId.equals(customerId!) & t.isShippingAddress.equals(isShippingAddress!) & t.isDeleted.equals(isDisable!)))
        .watch();
  }

  Stream<List<Addre>> watchAllAddressByTitleDual({String? customerId, String? addressType, bool? isDisable}) {
    return (select(db.addres)..where((t) => t.customerId.equals(customerId!) & t.isDeleted.equals(isDisable!))).watch();
  }

  Future<List<Addre>> getAllAddressByTitle(String customerId) {
    return (select(db.addres)..where((t) => t.customerId.equals(customerId) & t.latitude.isBiggerThanValue(0) & t.longitude.isSmallerThanValue(0)))
        .get();
  }

  Future<void> createOrUpdateAddress(Addre address) {
    return into(db.addres).insertOnConflictUpdate(address);
  }

  Future deleteAllSeriesNumberGenerator() => delete(db.seriesNumberGenerator).go();
}
