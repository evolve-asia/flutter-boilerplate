import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_boilerplate/storage/db_constants.dart';

import 'dao/users/user_dao.dart';
import 'entity/users_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'rosia_database.g.dart';

@Database(version: 1, entities: [UsersEntity])
abstract class RosiaDatabase extends FloorDatabase {
  static RosiaDatabase? _database;

  static Future<RosiaDatabase> getInstance() async {
    if (_database == null) {
      Future<RosiaDatabase> temp = $FloorRosiaDatabase
          .databaseBuilder(DatabaseConstants.DATABASE_NAME)
          .build();
      _database = await temp;
    }
    return _database!;
  }

  UsersDao get userDao;
}
