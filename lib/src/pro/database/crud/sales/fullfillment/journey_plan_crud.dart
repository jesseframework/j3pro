import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/journey_plan.dart';

import 'package:moor/moor.dart';

part 'journey_plan_crud.g.dart';

@UseDao(tables: [JourneyPlan])
class JourneyPlanDao extends DatabaseAccessor<AppDatabase>
    with _$JourneyPlanDaoMixin {
  final AppDatabase db;
  JourneyPlanDao(this.db) : super(db);

  //This is a test;
}
