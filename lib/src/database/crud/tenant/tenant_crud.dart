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

import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/models/tenant_model.dart';
import 'package:moor/moor.dart';

part 'tenant_crud.g.dart';

@UseDao(tables: [Tenant])
class TenantDao extends DatabaseAccessor<AppDatabase> with _$TenantDaoMixin {
  final AppDatabase db;
  TenantDao(this.db) : super(db);

  Future<List<TenantData>> getAllTenant() {
    return (select(db.tenant).get());
  }

  Future<TenantData> getSingleTenant(String tenantName, String userName) {
    return (select(db.tenant)
          ..where((t) =>
              t.tenantName.equals(tenantName) & t.userName.equals(userName)))
        .getSingle();
  }

  Stream<List<TenantData>> watchAllTenant() {
    return (select(db.tenant).watch());
  }

  Future<void> createOrUpdate(TenantCompanion tenantData) {
    return into(db.tenant).insertOnConflictUpdate(tenantData);
  }

  Future insertTenant(TenantData tenantData) =>
      into(db.tenant).insert(tenantData);

  Future deleteAllTenant() => delete(db.tenant).go();
}
