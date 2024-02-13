import 'package:j3enterprise/src/resources/shared/extension/multi_user.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class SalesOrderHeader extends Table implements MustHaveTenant, MultiUser {
  IntColumn get id => integer()();
  TextColumn get transactionNumber => text()();
  TextColumn get transactionStatus => text().nullable()();
  TextColumn get inventoryCycleNumber => text()();
  TextColumn get daySessionNumber => text()();
  TextColumn get customerId => text()();
  TextColumn get soldTo => text().nullable()();
  DateTimeColumn get orderDate => dateTime()();
  DateTimeColumn get deliveryDate => dateTime()();
  TextColumn get orderType => text()();
  TextColumn get orderStatus => text()();
  TextColumn get purchaseOrderNo => text().nullable()();
  TextColumn get currency => text()();
  RealColumn get exchangeRate => real()();
  TextColumn get tenantId => text().nullable()();
  IntColumn get couponCode => integer().nullable()();
  TextColumn get billingAddressName => text().nullable()();
  TextColumn get shippingAddressName => text().nullable()();
  TextColumn get yourInitial => text().nullable()();
  RealColumn get subTotal => real()();
  RealColumn get taxTotal => real()();
  RealColumn get depositTotal => real()();
  RealColumn get discountTotal => real()();
  RealColumn get shippingTotal => real()();
  IntColumn get itemCount => integer()();
  RealColumn get grandTotal => real()();
  TextColumn get discountType => text()();
  RealColumn get discountPercentage => real()();
  RealColumn get discountAmount => real()();
  TextColumn get userName => text()();
  IntColumn get userId => integer()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  DateTimeColumn get transactionStart => dateTime().nullable()();
  DateTimeColumn get transactionEnd => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
