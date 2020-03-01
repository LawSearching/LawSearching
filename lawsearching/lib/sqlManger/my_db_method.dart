import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';

/**
 *  sqflite数据库通用方法
 */

class MyDbMethod {
  /**
   * 利用Sqflite数据库存储数据
   */
  saveString(String tableName, String columnName, String contents) async {
    final db = await getDataBase('my_db.db', tableName, columnName);
    //写入字符串
    db.transaction((trx) {
      trx.rawInsert('INSERT INTO $tableName($columnName) VALUES("$contents")');
    });
    print('存入数据成功');
  }

  /**
   * 查询存在Sqflite数据库中的数据--->模糊查询(通用方法)
   */
  Future<List> searchpossibleString(String tableName, String columnName,
      {String searchName}) async {
    final db = await getDataBase('my_db.db', tableName, columnName);
    List<Map> list = [];
    list = await db
        .rawQuery(
            'SELECT * FROM $tableName WHERE $columnName like "%${searchName}%"') //模糊查询
        .then((List<Map> lists) {
      list = lists;
      //获取数据库查询到的数据
      //print('-------->$list');
      print(list[3]['${columnName}']);
      return list;
    });
    return list;
  }

  /**
   * 查询存在Sqflite数据库中的数据
   */
  Future<List> searchString(String tableName, String columnName,
      {String searchName}) async {
    final db = await getDataBase('my_db.db', tableName, columnName);
    List<Map> list = [];
    list =
        await db.rawQuery('SELECT * FROM $tableName ').then((List<Map> lists) {
      list = lists;
      //获取数据库查询到的数据
      print('-------->$list');
      return list;
    });
    return list;
  }

  /**
   * 获取Sqflite数据库中的某表的全部数据
   */
  getString(String tableName, String columnName) async {
    final db = await getDataBase('my_db.db', tableName, columnName);
    int listSize = 0;
    listSize =
        await db.rawQuery('SELECT * FROM $tableName ').then((List lists) {
      listSize = lists.length;
      //获取数据库中的最后一条数据
      print('现在数据库中一共有${listSize}条数据');
      return listSize;
    });
    return listSize;
  }

  /**
   * 初始化数据库存储路径
   */
  Future<Database> getDataBase(
      String dbName, String tableName, String columnName) async {
    //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
    final fileDirectory = await getApplicationDocumentsDirectory();

    //获取存储路径
    final dbPath = fileDirectory.path;

    //构建数据库对象
    Database database = await openDatabase(dbPath + "/" + dbName, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE $tableName (id INTEGER PRIMARY KEY, $columnName TEXT)");
    });

    return database;
  }
}
