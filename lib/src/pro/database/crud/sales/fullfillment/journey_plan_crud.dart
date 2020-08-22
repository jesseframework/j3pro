import 'package:j3enterprise/src/database/moor_database.dart';
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

  Future<List<JourneyPlanData>> getAllJourneyPlanByUser(String userName) {
    return (select(db.journeyPlan)..where((t) => t.assignTo.equals(userName)))
        .get();
  }

  Future<void> createOrUpdateJourneyPlan(JourneyPlanData journeyPlanData) {
    return into(db.journeyPlan).insertOnConflictUpdate(journeyPlanData);
  }

  Future deleteAllJourneyPlan() => delete(db.journeyPlan).go();
}
