import 'package:vidas/database/dao/dao.dart';

import 'package:vidas/model/vida.dart';

class StorageDao extends Dao {
  static const String _tableName = 'SAVED_GAMES';

  static Future<int?> createNewGame(Map<String, dynamic> row) async {
    return await Dao.insertRow(_tableName, row);
  }

  static Future<int?> saveGame(Map<String, dynamic> row) async {
    return await Dao.update(_tableName, row);
  }

  static Future<List<Vida>> getAllSavedGames() async {
    List<Map<String, dynamic>> vidas = await Dao.readTable(_tableName);
    return vidas.map((e) => Vida.fromSqlMap(e)).toList();
  }

  static Future<int> deleteSavedGame(int vidaId) async {
    return await Dao.delete(_tableName, vidaId);
  }

}
