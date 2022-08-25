import 'package:sqflite/sqflite.dart';

class DB {
  static Future<void> createTable(Database database) async {
    await database.execute("CREATE TABLE IF NOT EXISTS favorites(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, type TEXT);");
  }

  static Future<void> delete() async {
    await deleteDatabase("database.db");
  }

  static Future<Database> open() async {
    return openDatabase(
      "database.db",
      version: 1,
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createFavorite(String name, String type) async {
    final db = await open();

    final data = {"name": name, "type": type};
    final id = await db.insert("favorites", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<void> deleteFavorite(int id) async {
    final db = await open();
    try {
      await db.delete("favorites", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await open();
    return db.query("favorites", orderBy: "id");
  }
}
