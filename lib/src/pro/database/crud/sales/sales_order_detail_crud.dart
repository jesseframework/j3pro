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
import 'package:j3enterprise/src/pro/models/sales/sales_order_detail_model.dart';
import 'package:j3enterprise/src/pro/models/sales/sales_order_header_model.dart';
import 'package:moor/moor.dart';

part 'sales_order_detail_crud.g.dart';

@UseDao(tables: [SalesOrderDetail])
class SalesOrderDetailDao extends DatabaseAccessor<AppDatabase>
    with _$SalesOrderDetailDaoMixin {
  final AppDatabase db;
  SalesOrderDetailDao(this.db) : super(db);

  Future<List<SalesOrderDetailData>> getAllSalesOrderDetail() {
    return (select(db.salesOrderDetail).get());
  }

  Stream<List<SalesOrderDetailData>> watchAllSalesOrderDetail(String orderNo) {
    return (select(db.salesOrderDetail)
          ..where((t) => t.orderNumber.contains(orderNo)))
        .watch();
  }

  Future insertSalesOrderDetail(SalesOrderDetailData salesOrderDetailData) =>
      into(db.salesOrderDetail).insert(salesOrderDetailData);

  Future deleteAllSalesOrderDetail() => delete(db.salesOrderDetail).go();
}
