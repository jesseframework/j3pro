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

import 'package:j3enterprise/src/resources/shared/extension/must_have_tenant.dart';
import 'package:drift/drift.dart';

class Users extends Table implements MustHaveTenant {
  TextColumn get id => text()();
  TextColumn get userName => text().withLength(min: 1, max: 100)();
  TextColumn get name => text().withLength(min: 1, max: 300)();
  TextColumn get surname => text().withLength(min: 1, max: 150)();
  TextColumn get emailAddress => text().withLength(min: 5, max: 400)();
  BoolColumn get isActive => boolean().withDefault(Constant(false))();
  TextColumn get fullName => text().withLength(min: 1, max: 300)();
  TextColumn get mobileHash => text().nullable()();
  BoolColumn get enableOfflineLogin => boolean().withDefault(Constant(false))();
  TextColumn get firebaseToken => text().nullable()();
  DateTimeColumn get creationTime => dateTime().nullable()();
  DateTimeColumn get lastLoginTime => dateTime().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get currency => text().nullable()();
  TextColumn get themeData => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
