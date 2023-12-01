import 'package:vidas/database/dao/dao.dart';

import 'package:vidas/model/vida.dart';

class StorageDao extends Dao {

  /// The name of the table that stores game states in the database.
  static const String _tableName = 'SAVED_GAMES';

  /// Creates a new game in the database and returns the id of the inserted row.
  static Future<int?> createNewGame(Map<String, dynamic> row) async {
    return await Dao.insertRow(_tableName, row);
  }

  /// Updates a game in the database using its id and returns the number of rows
  /// updated. It should always update only one row.
  static Future<int?> saveGame(Map<String, dynamic> row) async {
    return await Dao.update(_tableName, row);
  }

  /// Gets a list of all saved games from the database.
  static Future<List<Vida>> getAllSavedGames() async {
    List<Map<String, dynamic>> vidas = await Dao.readTable(_tableName);
    return vidas.map((e) => Vida.fromSqlMap(e)).toList();
  }

  /// Deletes a saved game from the database using its id and returns the number
  /// of games deleted. It should always delete only one row.
  static Future<int> deleteSavedGame(int vidaId) async {
    return await Dao.delete(_tableName, vidaId);
  }

}
