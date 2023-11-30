import 'package:vidas/database/dao/dao.dart';

class StorageDao extends Dao {
  static const String _tableName = 'SAVED_GAMES';

  static Future<int?> saveNewGame(Map<String, dynamic> row) async {
    return await Dao.insertRow(_tableName, row);
  }

  static Future<List<Map<String,dynamic>>> getAllSavedGames() async {
    return await Dao.readTable(_tableName);
  }



}
