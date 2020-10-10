import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/journey_plan.dart';
import 'package:moor/moor.dart';

part 'journey_plan_crud.g.dart';

@UseDao(tables: [JourneyPlan])
class JourneyPlanDao extends DatabaseAccessor<AppDatabase>
    with _$JourneyPlanDaoMixin {
  final AppDatabase db;
  JourneyPlanDao(this.db) : super(db);

  Future<List<JourneyPlanData>> getAllJourneyPlanData() {
    return (select(db.journeyPlan).get());
  }

  Stream<List<JourneyPlanData>> watchAllJourneyPlanByUser(String userName) {
    return (select(db.journeyPlan)..where((t) => t.assignTo.equals(userName)))
        .watch();
  }

  // in the database class, we can then load the category for each entry
  //TODO get customer by pasing the specfic username
  Stream<List<JourneyWithAddress>> watchJourneyWithAddressJoin(
      String username) {
    final query = select(db.journeyPlan).join([
      leftOuterJoin(db.address,
          db.journeyPlan.customerId.equalsExp(db.address.customerId)),
      leftOuterJoin(db.contact,
          db.journeyPlan.customerId.equalsExp(db.contact.customerId))
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return JourneyWithAddress(row.readTable(db.address),
            row.readTable(db.journeyPlan), row.readTable(db.contact));
      }).toList();
    });
  }

  Stream<List<JourneyPlanData>> watchAllJourneyPlanByUserandAddress(
      String userName) {
    return customSelect(
      'SELECT'
      'j.customer_name,'
      'j.company_name,'
      'a.address_line1 '
      'FROM '
      'journey_plan j '
      'left outer join address a on j.customer_id = a.customer_id '
      'WHERE '
      'j.is_deleted = 0 '
      'and j.user_name = $userName ',
      readsFrom: {
        db.journeyPlan
      }, // used for the stream: the stream will update when either table changes
    ).watch().map((rows) {
      return rows.map((row) => JourneyPlanData.fromData(row.data, db)).toList();
    });
  }

  Future<List<JourneyPlanData>> getAllJourneyPlanByUser(String userName) {
    return (select(db.journeyPlan)..where((t) => t.assignTo.equals(userName)))
        .get();
  }

  Future<void> createOrUpdateJourneyPlan(JourneyPlanData journeyPlanData) {
    return into(db.journeyPlan).insertOnConflictUpdate(journeyPlanData);
  }

  Future deleteAllJourneyPlan() => delete(db.journeyPlan).go();
}
