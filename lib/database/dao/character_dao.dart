import 'package:vidas/database/dao/dao.dart';

import 'package:vidas/model/character.dart';

class CharacterDao extends Dao {
  static const String _characterTableName = 'CHARACTER_GAME';

  static Future<int?> createNewCharacter(
    Character character,
    int gameId,
  ) async {
    Map<String, dynamic> characterMap = character.toSqlMap();

    characterMap['game_id'] = gameId;

    return await Dao.insertRow(_characterTableName, characterMap);
  }

  static Future<int?> saveCharacter(Character character) async {
    Map<String, dynamic> characterMap = character.toSqlMap();

    return await Dao.update(_characterTableName, characterMap);
  }

  static Future<Character?> getCharacter(int gameId) async {
    List<Map<String, dynamic>> characters = await Dao.readRows(
      'game_id = ?',
      _characterTableName,
      [gameId],
    );

    if (characters.isEmpty) {
      return null;
    }

    return Character.fromSqlMap(characters.first);
  }

  static Future<int?> deleteCharacter(int gameId) async {
    return await Dao.delete(_characterTableName, gameId, columnName: 'game_id');
  }
}
