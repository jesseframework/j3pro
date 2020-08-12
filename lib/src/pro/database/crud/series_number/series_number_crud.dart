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
import 'package:j3enterprise/src/pro/models/series_number/series_number_model.dart';

import 'package:moor/moor.dart';

part 'series_number_crud.g.dart';

@UseDao(tables: [SeriesNumberGenerator])
class SeriesNumberGeneratorDao extends DatabaseAccessor<AppDatabase>
    with _$SeriesNumberGeneratorDaoMixin {
  final AppDatabase db;
  SeriesNumberGeneratorDao(this.db) : super(db);

  Future<List<SeriesNumberGeneratorData>> getAllAllSeriesNumber() {
    return (select(db.seriesNumberGenerator).get());
  }

  Stream<List<SeriesNumberGeneratorData>> watchAllSeriesNumberByType(
      String typeOfNumber) {
    return (select(db.seriesNumberGenerator)
          ..where((t) => t.typeOfNumber.equals(typeOfNumber)))
        .watch();
  }

   Future<List<SeriesNumberGeneratorData>> getAllSeriesNumberByType(
      String typeOfNumber) {
    return (select(db.seriesNumberGenerator)
          ..where((t) => t.typeOfNumber.equals(typeOfNumber)))
        .get();
  }

  Future<void> createOrUpdateSeriesNumber(
      SeriesNumberGeneratorData seriesNumberGeneratorData) {
    return into(db.seriesNumberGenerator)
        .insertOnConflictUpdate(seriesNumberGeneratorData);
  }

  Future deleteAllSeriesNumberGenerator() =>
      delete(db.seriesNumberGenerator).go();
}
