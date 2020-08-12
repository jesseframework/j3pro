import 'package:j3enterprise/src/resources/shared/extension/multi_user.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class SalesOrderHeader extends Table implements MustHaveTenant, MultiUser {
  IntColumn get id => integer()();
  TextColumn get orderNumber => text()();
  TextColumn get inventoryCycleNumber => text()();
  TextColumn get daySessionNumber => text()();
  IntColumn get customerId => integer()();
  TextColumn get soldTo => text().nullable()();
  DateTimeColumn get orderDate => dateTime()();
  DateTimeColumn get deliveryDate => dateTime()();
  TextColumn get orderType => text()();
  TextColumn get orderStatus => text()();
  TextColumn get purchaseOrderNo => text().nullable()();
  TextColumn get currency => text()();
  RealColumn get exchangeRate => real()();
  IntColumn get tenantId => integer().nullable()();
  IntColumn get cuponCode => integer().nullable()();
  TextColumn get billingAddressName => text().nullable()();
  TextColumn get shippingAddressName => text().nullable()();
  TextColumn get yourInital => text().nullable()();
  RealColumn get subTotal => real()();
  RealColumn get taxTotal => real()();
  RealColumn get depositTotal => real()();
  RealColumn get discountTotal => real()();
  RealColumn get shippingTotal => real()();
  IntColumn get itemCount => integer()();
  RealColumn get grandtotalTotal => real()();
  TextColumn get discountType => text()();
  RealColumn get discountPercentage => real()();
  RealColumn get discountAmount => real()();
  TextColumn get uerName => text()();
  IntColumn get userId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
