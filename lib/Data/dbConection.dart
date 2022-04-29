import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDB {
  static const _productsTableName = "productsTable";

  Future<Database> _openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'db.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $_productsTableName (id INTEGER PRIMARY KEY, name TEXT, price real)');
    });

    return database;
  }

  Future<List<dynamic>> fetchData() async {
    var db = await _openDb();
    var rows = await db.query(_productsTableName);
    return rows;
  }

  dynamic insertData(data) async {
    var db = await _openDb();
    return await db.insert(_productsTableName, data);
  }

  dynamic deleteById(id) async {
    var db = await _openDb();
    return await db.delete(_productsTableName, where: "id=?", whereArgs: [id]);
  }
}
