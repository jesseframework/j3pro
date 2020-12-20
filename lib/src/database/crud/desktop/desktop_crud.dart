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
import 'package:j3enterprise/src/models/desktop_model.dart';
import 'package:moor/moor.dart';

part 'desktop_crud.g.dart';

@UseDao(tables: [Desktop])
class DesktopDao extends DatabaseAccessor<AppDatabase> with _$DesktopDaoMixin {
  final AppDatabase db;
  DesktopDao(this.db) : super(db);

  Future<List<DesktopData>> getAllDesktop() {
    return (select(db.desktop).get());
  }

   Future<void> createOrUpdatePref(DesktopData desktopData) {
    return into(db.desktop).insertOnConflictUpdate(desktopData);
  }

  Stream<List<DesktopData>> watchAllDesktop(
    String functionName,
    bool isDelete,
    String featureCode,
    String userPermission) {
    return (select(db.desktop)..where((t) => 
            t.iconName.contains(functionName) &
             t.isDeleted.equals(isDelete) &
             t.featureCode.contains(featureCode) &
             t.userPermission.contains(userPermission))).watch();
  }
 Stream<List<DesktopData>> watchAllActivitiesMenu( 
   String functionName,
    bool isDelete,
    String featureCode,
    String userPermission) {
    return (select(db.desktop)..where((t) => 
            t.iconGroup.equals(functionName) &
             t.isDeleted.equals(isDelete) &           
             t.userPermission.contains(userPermission))).watch();
  }
  Future insertBusinessRule(DesktopData desktopData) =>
      into(db.desktop).insert(desktopData);

  Future deleteAllBusinessRule() => delete(db.desktop).go();


}
