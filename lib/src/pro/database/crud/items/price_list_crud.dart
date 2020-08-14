import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/items/price_list_model.dart';
import 'package:moor/moor.dart';

part 'price_list_crud.g.dart';

@UseDao(tables: [PriceList])
class PriceListDao extends DatabaseAccessor<AppDatabase>
    with _$PriceListDaoMixin {
  final AppDatabase db;

  PriceListDao(this.db) : super(db);

  Future<List<PriceListData>> getAllPriceListData() {
    return (select(db.priceList).get());
  }

  Stream<List<PriceListData>> watchAllPriceList(String priceListName) {
    return (select(db.priceList)
          ..where((t) => t.priceListName.equals(priceListName)))
        .watch();
  }

  Future<List<PriceListData>> getAllPriceList(String priceListName) {
    return (select(db.priceList)
          ..where((t) => t.priceListName.equals(priceListName)))
        .get();
  }

  Future<void> createOrUpdateItems(PriceListData priceListData) {
    return into(db.priceList).insertOnConflictUpdate(priceListData);
  }

  Future deleteAllPriceList() => delete(db.priceList).go();
}
