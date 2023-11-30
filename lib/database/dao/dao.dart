import 'package:sqflite/sqflite.dart';
import 'package:vidas/database/database_connection.dart';

class Dao {
  static Database _getDatabase() {
    Database? db = DatabaseConnection.instance.database;

    if (db != null) {
      return db;
    } else {
      throw Exception('Error getting database');
    }
  }

  /// Inserts a row in the database where each key in the Map is a column name
  /// and the value is the column value. The return value is the id of the
  /// inserted row.
  static Future<int?> insertRow(String table, Map<String, dynamic> row) async {
    Database db = _getDatabase();
    return await db.insert(table, row);
  }

  /// All of the rows are returned as a list of maps, where each map is
  /// a key-value list of columns.
  static Future<List<Map<String, dynamic>>> readTable(String table) async {
    Database db = _getDatabase();
    return await db.query(table);
  }

  /// All of the rows are returned as a list of maps, where each map is
  /// a key-value list of columns.
  static Future<List<Map<String, dynamic>>> readRows(
    String where,
    String table,
    List<dynamic> whereArgs, {
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    Database db = _getDatabase();
    return await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  /// All of the methods (insert, query, update, delete) can also be done using
  /// raw SQL commands. This method uses a raw query to give the row count.
  static Future<int> readRowCount(String table) async {
    Database db = _getDatabase();
    final results = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  /// We are assuming here that the id column in the map is set. The other
  /// column values will be used to update the row.
  static Future<int> update(String table, Map<String, dynamic> row) async {
    Database db = _getDatabase();

    int id = row['id'];

    return await db.update(
      table,
      row,
      where: '$id = ?',
      whereArgs: [id],
    );
  }

  /// Deletes the row specified by the id. The number of affected rows is
  /// returned. This should be 1 as long as the row exists.
  static Future<int> delete(String table, int id) async {
    Database db = _getDatabase();

    return await db.delete(
      table,
      where: '$id = ?',
      whereArgs: [id],
    );
  }
}
