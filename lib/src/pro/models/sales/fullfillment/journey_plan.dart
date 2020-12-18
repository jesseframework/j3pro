import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class JourneyPlan extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get customerId => text()();
  TextColumn get customerName => text()();
  TextColumn get companyName => text()();
  TextColumn get customerType => text()();
  TextColumn get customerGroup => text()();
  TextColumn get customerTerritory => text()();
  TextColumn get billingAddressName => text().nullable()();
  TextColumn get shippingAddressName => text().nullable()();
  TextColumn get assignTo => text().nullable()();
  DateTimeColumn get expiryDate => dateTime().nullable()();
  IntColumn get weekNumber => integer().nullable()();
  TextColumn get weekDay => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();


  @override
  Set<Column> get primaryKey => {id};
}
