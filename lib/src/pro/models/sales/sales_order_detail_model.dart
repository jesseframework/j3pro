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

class SalesOrderDetail extends Table implements MustHaveTenant, MultiUser {
  IntColumn get id => integer()();
  TextColumn get orderNumber => text()();
  TextColumn get inventoryCycleNumber => text()();
  TextColumn get daySessionNumber => text()();
  DateTimeColumn get deliveryDate => dateTime()();
  TextColumn get currency => text()();
  RealColumn get exchangeRate => real()();
  IntColumn get tenantId => integer().nullable()();
  TextColumn get uerName => text()();
  IntColumn get userId => integer()();

  IntColumn get itemId => integer()();
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

  RealColumn get unitPrice => real()();
  RealColumn get costPrice => real()();
  RealColumn get listPrice => real()();
  RealColumn get quantity => real()();
  RealColumn get subTotal => real()();
  RealColumn get taxTotal => real()();
  RealColumn get shippingTotal => real()();
  RealColumn get conversionFactor => real()();

  @override
  Set<Column> get primaryKey => {id};
}
