import 'package:j3enterprise/src/resources/shared/extension/multi_user.dart';
import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:moor/moor.dart';

class SalesOrderDetailTemp extends Table implements MustHaveTenant, MultiUser {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get transactionNumber => text()();
  TextColumn get inventoryCycleNumber => text().nullable()();
  TextColumn get daySessionNumber => text().nullable()();
  DateTimeColumn get deliveryDate => dateTime().nullable()();
  TextColumn get currency => text().nullable()();
  RealColumn get exchangeRate => real().nullable()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get userName => text()();
  IntColumn get userId => integer()();
  TextColumn get transactionStatus => text().nullable()();
  IntColumn get itemId => integer()();
  TextColumn get itemCode => text()();
  TextColumn get upcCode => text().nullable()();
  TextColumn get description => text()();
  TextColumn get itemGroup => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get salesUOM => text().nullable()();
  TextColumn get stockUOM => text().nullable()();
  TextColumn get taxGroup => text().nullable()();
  TextColumn get warehouse => text().nullable()();
  TextColumn get discountType => text().nullable()();
  RealColumn get discountPercentage => real().nullable()();
  RealColumn get discountAmount => real().nullable()();
  RealColumn get lineDiscountTotal => real().nullable()();
  TextColumn get taxIndicator => text().nullable()();
  RealColumn get unitPrice => real()();
  RealColumn get costPrice => real().nullable()();
  RealColumn get listPrice => real().nullable()();
  RealColumn get quantity => real()();
  RealColumn get subTotal => real()();
  RealColumn get grandTotal => real()();
  IntColumn get itemCount => integer().nullable()();
  RealColumn get depositTotal => real().nullable()();
  IntColumn get lineId => integer().nullable()();
  RealColumn get taxTotal => real().nullable()();
  RealColumn get shippingTotal => real()();
  RealColumn get conversionFactor => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
