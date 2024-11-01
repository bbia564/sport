
import 'dart:convert';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sports/db_sports/sport_entity.dart';
import 'package:sqflite/sqflite.dart';

class DBSports extends GetxService {
  late Database dbBase;

  Future<DBSports> init() async {
    await createSportsDB();
    return this;
  }

  createSportsDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'sports.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createSportsTable(db);
        });
  }

  createSportsTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS sports (id INTEGER PRIMARY KEY, createTime TEXT, title TEXT, list TEXT, finishTime TEXT)');
  }

  insertSports(SportEntity entity) async {
    final id = await dbBase.insert('sports', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
      'finishTime': entity.finishTime.toIso8601String(),
    });
    return id;
  }

  updateSports(SportEntity entity) async {
    await dbBase.update('sports', {
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
      'finishTime': entity.finishTime.toIso8601String(),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanSportsData() async {
    await dbBase.delete('sports');
  }

  Future<List<SportEntity>> getSportsAllData() async {
    var result = await dbBase.query('sports', orderBy: 'createTime DESC');
    return result.map((e) => SportEntity.fromJson(e)).toList();
  }
}
