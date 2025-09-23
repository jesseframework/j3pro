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

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:j3enterprise/src/database/crud/user/user_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';

import 'dart:convert';

import 'package:drift/drift.dart' as moor;

class UserHash {
  final UserRepository userRepository;
  late UserDao userDao;
  var db;

  UserHash({required this.userRepository}) {
    //assert(userRepository != null);
    db = MyDatabase();
    userDao = UserDao(db);
  }

  Future<String> createHash(String password, int tenantId, int userId) async {
    List<List<int>> bytesChunks = [
      utf8.encode(password),
      utf8.encode(userId.toString()),
      utf8.encode(tenantId.toString())
    ];

    var output = AccumulatorSink<Digest>();

    ByteConversionSink input = sha512.startChunkedConversion(output);
    for (var bytes in bytesChunks) {
      input.add(bytes);
    }
    input.close();

    Digest result = output.events.single;

    String result0 = result.toString();
    //return _result;
    print('Created Hash $result0');
    return result0;
  }
}

class UserHashSave {
  final UserRepository userRepository;
  var db;
  late UserDao userDao;
  late UserHash userHash;

  UserHashSave({required this.userRepository}) {
    //assert(userRepository != null);
    db = MyDatabase();
    userDao = UserDao(db);
    userHash = UserHash(userRepository: userRepository);
  }
  Future<void> saveHash(String password, int tenantId, int userId) async {
    String result = await userHash.createHash(password, tenantId, userId);
    print('MyKey $result');
    var formData = UsersCompanion(mobileHash: moor.Value(result.toString()));

    await userDao.saveMobileHash(formData, userId);
    await userRepository.putUserHash(
        userId: userId, mobileHashCode: result.toString(), tenantId: tenantId);

    print('Result: $result');
  }
}
