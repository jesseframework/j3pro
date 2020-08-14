import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/customer/address_model.dart';
import 'package:moor/moor.dart';

part 'address_crud.g.dart';

@UseDao(tables: [Address])
class AddressDao extends DatabaseAccessor<AppDatabase> with _$AddressDaoMixin {
  final AppDatabase db;
  AddressDao(this.db) : super(db);

  Future<List<Addres>> getAllAddress() {
    return (select(db.address).get());
  }

  Stream<List<Addres>> watchAllAddressByTitle(String addressTitle) {
    return (select(db.address)
          ..where((t) => t.addressTitle.equals(addressTitle)))
        .watch();
  }

  Future<List<Addres>> getAllAddressByTitle(String addressTitle) {
    return (select(db.address)
          ..where((t) => t.addressTitle.equals(addressTitle)))
        .get();
  }

  Future<void> createOrUpdateAddress(Addres address) {
    return into(db.address).insertOnConflictUpdate(address);
  }

  Future deleteAllSeriesNumberGenerator() =>
      delete(db.seriesNumberGenerator).go();
}
