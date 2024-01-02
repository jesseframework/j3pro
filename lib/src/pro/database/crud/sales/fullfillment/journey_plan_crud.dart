import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/journey_plan.dart';
import 'package:drift/drift.dart';

part 'journey_plan_crud.g.dart';

@DriftAccessor(tables: [JourneyPlan])
class JourneyPlanDao extends DatabaseAccessor<MyDatabase> with _$JourneyPlanDaoMixin {
  final MyDatabase db;
  JourneyPlanDao(this.db) : super(db);

  Future<List<JourneyPlanData>> getAllJourneyPlanData() {
    return (select(db.journeyPlan).get());
  }

  Stream<List<JourneyPlanData>> watchAllJourneyPlanByUser(String userName) {
    return (select(db.journeyPlan)..where((t) => t.assignTo.equals(userName))).watch();
  }

  // in the database class, we can then load the category for each entry
  Stream<List<JourneyWithAddress>> watchJourneyWithAddressJoin(String userName, String addressType, bool isDelete, String searchText) {
    final query = select(db.journeyPlan).join([
      leftOuterJoin(db.address, db.journeyPlan.customerId.equalsExp(db.address.customerId)),
      leftOuterJoin(db.contact, db.journeyPlan.customerId.equalsExp(db.contact.customerId))
    ]);

    // ..where(db.address.addressType.equals(addressType) &
    //     db.journeyPlan.assignTo.equals(userName) &
    //     db.journeyPlan.isDeleted.equals(isDelete) &
    //     (db.journeyPlan.customerName.contains(searchText) |
    //         db.journeyPlan.customerGroup.contains(searchText) |
    //         db.journeyPlan.customerId.contains(searchText) |
    //         db.address.addressLine1.contains(searchText) |
    //         db.address.addressLine2.contains(searchText)));
    return query.watch().map((rows) {
      return rows.map((row) {
        return JourneyWithAddress(row.readTable(db.address), row.readTable(db.journeyPlan), row.readTable(db.contact));
      }).toList();
    });
  }

 Future getAllJourneyPlanByUserAndCustomer(String userName, String customerId) {
    return (select(db.journeyPlan)).get();
  }
  Future updateGPSDistance(JourneyPlanCompanion jp, String customerid, String userName, String transactionStatus) {
    return (update(db.journeyPlan)..where((t) => t.customerId.equals(customerid))).write(
      JourneyPlanCompanion(
          inKilometer: jp.inKilometer, inMeter: jp.inMeter, inMiles: jp.inMiles, distanceLabel: jp.distanceLabel, distanceUsed: jp.distanceUsed),
    );
  }

  Future updateTransactionStatus(JourneyPlanCompanion ts, String customerid, String userName, String transactionStatus) {
    return (update(db.journeyPlan)..where((t) => t.customerId.equals(customerid))).write(
      JourneyPlanCompanion(transactionStatus: ts.transactionStatus),
    );
  }

  Future<List<JourneyPlanData>> getAllJourneyPlanByUser(String userName) {
    return (select(db.journeyPlan)..where((t) => t.assignTo.equals(userName))).get();
  }

  Future<List<JourneyPlanData>> getAllJourneyPlanByCustomer(String customerId) {
    return (select(db.journeyPlan)..where((t) => t.customerId.equals(customerId))).get();
  }

  Future<void> createOrUpdateJourneyPlan(JourneyPlanData journeyPlanData) {
    return into(db.journeyPlan).insertOnConflictUpdate(journeyPlanData);
  }

  Future deleteAllJourneyPlan() => delete(db.journeyPlan).go();
}
