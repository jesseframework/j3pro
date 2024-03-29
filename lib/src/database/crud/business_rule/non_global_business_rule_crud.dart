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

import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/models/non_global_business_rule.dart';
import 'package:drift/drift.dart';

part 'non_global_business_rule_crud.g.dart';

@DriftAccessor(tables: [NonGlobalBusinessRule])
class NonGlobalBusinessRuleDao extends DatabaseAccessor<MyDatabase> with _$NonGlobalBusinessRuleDaoMixin {
  final MyDatabase db;
  NonGlobalBusinessRuleDao(this.db) : super(db);

  Future<List<BusinessRuleData>> getAllBusinessRule() {
    return (select(db.businessRule).get());
  }

  Future<NonGlobalBusinessRuleData> getSingleNonGlobalBusinessRule(String parentCode, String code, String userName, String deviceId, String screen) {
    return (select(db.nonGlobalBusinessRule)
          ..where((u) =>
              u.code.equals(code) &
              u.parentCode.equals(parentCode) &
              (u.userName.equals(userName) | u.deviceId.equals(deviceId) | u.screen.equals(screen))))
        .getSingle();
  }

  Stream<List<NonGlobalBusinessRuleData>> watchAllNonGlobalBussinessRule(String parentCode) {
    return (select(db.nonGlobalBusinessRule)..where((t) => t.parentCode.equals(parentCode))).watch();
  }

  Future<void> createOrUpdatePref(NonGlobalBusinessRuleData pref) {
    return into(db.nonGlobalBusinessRule).insertOnConflictUpdate(pref);
  }

  Future insertBusinessRule(BusinessRuleData businessRuleData) => into(db.businessRule).insert(businessRuleData);

  Future updateNonGlobalBussinessRuleValue(NonGlobalBusinessRuleData nonGlobalBusinessRuleData) =>
      update(db.nonGlobalBusinessRule).replace(nonGlobalBusinessRuleData);

  Future deleteAllBusinessRule() => delete(db.businessRule).go();
}
