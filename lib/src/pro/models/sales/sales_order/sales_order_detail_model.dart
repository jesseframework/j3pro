import 'package:j3enterprise/src/resources/shared/extension/multi_user.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class SalesOrderDetail extends Table implements MustHaveTenant, MultiUser {
  IntColumn get id => integer()();
  TextColumn get transactionNumber => text()();
  TextColumn get inventoryCycleNumber => text()();
  TextColumn get daySessionNumber => text()();
  DateTimeColumn get deliveryDate => dateTime()();
  TextColumn get currency => text()();
  RealColumn get exchangeRate => real()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get userName => text()();
  IntColumn get userId => integer()();
  TextColumn get transactionStatus => text().nullable()();
  TextColumn get itemId => text().nullable()();
  TextColumn get itemCode => text()();
  TextColumn get upcCode => text()();
  TextColumn get description => text()();
  TextColumn get itemGroup => text()();
  TextColumn get category => text()();
  TextColumn get salesUOM => text()();
  TextColumn get stockUOM => text()();
  TextColumn get taxGroup => text()();
  TextColumn get warehouse => text()();
  TextColumn get discountType => text()();
  RealColumn get discountPercentage => real()();
  RealColumn get discountAmount => real()();
  RealColumn get lineDiscountTotal => real()();
  TextColumn get taxIndicator => text().nullable()();
  RealColumn get unitPrice => real()();
  RealColumn get costPrice => real()();
  RealColumn get listPrice => real()();
  RealColumn get quantity => real()();
  RealColumn get subTotal => real()();
  RealColumn get grandTotal => real()();
  IntColumn get itemCount => integer().nullable()();
  RealColumn get depositTotal => real().nullable()();
  IntColumn get lineId => integer().nullable()();
  RealColumn get taxTotal => real()();
  RealColumn get shippingTotal => real()();
  RealColumn get conversionFactor => real()();

  @override
  Set<Column> get primaryKey => {id};
}
