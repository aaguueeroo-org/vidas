import 'package:sqflite/sqflite.dart';
import 'package:vidas/database/database_connection.dart';

/// Data Access Object that manages all database operations abstractly.
///
/// This is the only class that communicates with the database. All its methods
/// are static and can be called from anywhere in the app, by giving specific
/// parameters and thus making the operations specific.
class Dao {
  /// Gets the database instance from the [DatabaseConnection] singleton.
  static Database _getDatabase() {
    Database? db = DatabaseConnection.instance.database;

    if (db != null) {
      return db;
    } else {
      throw Exception('Error getting database');
    }
  }

  /// Inserts a row into the specified table.
  ///
  /// Calls a method from the [Database] class to insert a row into the table
  /// with the name specified in the parameters. The row is a map of strings
  /// and dynamic values, which are the column names and the values to be
  /// inserted into the row, respectively.
  ///
  /// Returns the id of the inserted row.
  static Future<int?> insertRow(String table, Map<String, dynamic> row) async {
    Database db = _getDatabase();
    return await db.insert(table, row);
  }

  /// Reads all the rows from the specified table.
  ///
  /// Calls a method from the [Database] class to read all the rows from the
  /// table with the name specified in the parameters.
  ///
  /// Returns a list of maps, where each map represents a row from the table.
  /// The keys of the map are the column names and the values are the values
  /// of the row.
  static Future<List<Map<String, dynamic>>> readTable(String table) async {
    Database db = _getDatabase();
    return await db.query(table);
  }

  /// Reads a row from the specified table with specified parameters.
  ///
  /// Calls a method from the [Database] class to read a row from the table
  /// with the name specified in the parameters. The parameters are used to
  /// specify the conditions of the query, such as the where clause, the
  /// where arguments, the group by clause, the having clause, the order by
  /// clause, the limit and the offset.
  ///
  /// Returns a list of maps, where each map represents a row from the table.
  /// The keys of the map are the column names and the values are the values
  /// of the row.
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

  static Future<List<Map<String, dynamic>>> joinTables(
    String table1,
    String table2,
    String joinType,
    String on,
    List<dynamic> whereArgs, {
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    Database db = _getDatabase();
    return await db.rawQuery(
      'SELECT * FROM $table1 $joinType $table2 ON $on',
      whereArgs,
    );
  }

  /// Gets the number of rows in the specified table.
  ///
  /// Calls a method from the [Database] class to get the number of rows in
  /// the table with the name specified in the parameters.
  ///
  /// Returns the number of rows in the table.
  static Future<int> readRowCount(String table) async {
    Database db = _getDatabase();
    final results = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  /// Updates a row from the specified table by using the field `id` from the
  /// row.
  ///
  /// Calls a method from the [Database] class to update a row from the table
  /// with the name specified in the parameters. The row is a map of strings
  /// and dynamic values, which are the column names and the values to be
  /// inserted into the row, respectively. The row must have a field `id` that
  /// is used to identify the row to be updated.
  ///
  /// Returns the number of rows updated.
  static Future<int> update(String table, Map<String, dynamic> row) async {
    Database db = _getDatabase();

    int id = row['id'];

    return await db.update(
      table,
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Deletes a row from the specified table by field `id`.
  ///
  /// Calls a method from the [Database] class to delete a row from the table
  /// with the name specified in the parameters. The row to delete is found
  /// thanks to the parameter [id] which is an int.
  ///
  /// Returns the number of rows deleted, which should always be 1.
  static Future<int> delete(String table, int id, {String columnName = 'id'}) async {
    Database db = _getDatabase();

    return await db.delete(
      table,
      where: '$columnName = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, Object?>>> rawQuery(String query,
      {List<Object>? arguments}) async {
    Database db = _getDatabase();

    return await db.rawQuery(query, arguments);
  }
}
