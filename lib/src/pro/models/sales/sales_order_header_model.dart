/*
 * Jesseframework - Computer Expertz Ltd - https://cpxz.us
 * Copyright (C) 2019-2021 Jesseframework
 *
 * This file is part of Jesseframework - https://github.com/jesseframework/j3.
 *
 * Jesseframework is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version. 
 *
 * Jesseframework is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 */

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
