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

import 'package:j3enterprise/src/resources/shared/extension/full_audited.dart';
import 'package:j3enterprise/src/resources/shared/extension/sync_trigger.dart';
import 'package:drift/drift.dart';

class Communication extends Table implements FullAudited, SyncTrigger {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serverUrl => text()();
  TextColumn get userName => text().nullable()();
  TextColumn get newPasskey => text().nullable()();
  TextColumn get confirmPasskey => text().nullable()();
  TextColumn get syncFrequency => text()();
  TextColumn get communicationType => text()();
  TextColumn get typeofErp => text().nullable()();
  @override
  IntColumn get createUserId => integer().nullable()();
  @override
  DateTimeColumn get creationTime => dateTime().nullable()();
  @override
  DateTimeColumn get deleteTime => dateTime().nullable()();
  @override
  IntColumn get deleteUserId => integer().nullable()();
  @override
  TextColumn get creatorUser => text().nullable()();
  @override
  TextColumn get deleterUserId => text().nullable()();
  @override
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  @override
  TextColumn get lastModifierUser => text().nullable()();
  @override
  IntColumn get lastModifierUserId => integer().nullable()();
  @override
  DateTimeColumn get exportDateTime => dateTime().nullable()();
  @override
  TextColumn get exportStatus =>
      text().withDefault(const Constant('Pending'))();
  @override
  DateTimeColumn get importDateTime => dateTime().nullable()();
  @override
  TextColumn get importStatus =>
      text().withDefault(const Constant('Pending'))();
  @override
  TextColumn get syncError => text().nullable()();
  IntColumn get tenantId => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
