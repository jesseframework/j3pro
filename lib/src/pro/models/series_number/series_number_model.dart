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
import 'package:moor/moor.dart';

class SeriesNumberGenerator extends Table implements MustHaveTenant {
  IntColumn get id => integer()();
  TextColumn get numberPrefix => text().nullable()();
  IntColumn get tenantId => integer().nullable()();
  BoolColumn get includePrefix => boolean().withDefault(Constant(false))();
  BoolColumn get includeJulianDate => boolean().withDefault(Constant(false))();
  BoolColumn get includeUserID => boolean().withDefault(Constant(false))();
  BoolColumn get includetenantId => boolean().withDefault(Constant(false))();
  BoolColumn get usedAutoNumber => boolean().withDefault(Constant(false))();
  IntColumn get endingLength => integer().nullable()();
  TextColumn get typeOfNumber => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
