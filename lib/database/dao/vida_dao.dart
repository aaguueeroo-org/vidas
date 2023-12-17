import 'package:vidas/database/dao/dao.dart';
import 'package:vidas/database/dao/education_dao.dart';
import 'package:vidas/model/education/education.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/model/game_saving_slot.dart';

import 'package:vidas/model/character.dart';
import 'package:vidas/database/dao/character_dao.dart';

class VidaDao extends Dao {
  /// The name of the table that stores game states in the database.
  static const String _gamesTableName = 'GAME';

  /// Creates a new game in the database and returns the id of the inserted row.
  static Future<int?> createNewGame() async {
    Map<String, dynamic> vidaMap = {};

    vidaMap['current_year'] = DateTime.now().year;
    vidaMap['created_on'] = DateTime.now().toIso8601String();
    vidaMap['last_modified'] = DateTime.now().toIso8601String();

    return await Dao.insertRow(_gamesTableName, vidaMap);
  }

  /// Updates a game in the database using its id and returns the number of rows
  /// updated. It should always update only one row.
  static Future<int?> saveGame(Vida vida) async {
    Map<String, dynamic> vidaMap = vida.toSqlMap();
    //TODO save educations, character

    vidaMap['last_modified'] = DateTime.now().toIso8601String();

    return await Dao.update(_gamesTableName, vidaMap);
  }

  /// Gets a list of all saved games from the database.
  static Future<List<GameSavingSlot>> getAllSavedGames() async {
    List<Map<String, dynamic>> savedGames = await Dao.rawQuery(
        'SELECT GAME.id, GAME.created_on, GAME.last_modified, CHARACTER_GAME.name, CHARACTER_GAME.avatar_id, CHARACTER_GAME.age FROM GAME '
        'LEFT JOIN CHARACTER_GAME '
        'ON CHARACTER_GAME.game_id = GAME.id');

    List<GameSavingSlot> vidaSavingSlots = [];

    for (var savedGame in savedGames) {
      vidaSavingSlots.add(GameSavingSlot.fromSqlMap(savedGame));
    }

    return vidaSavingSlots;
  }

  static Future<Vida> getVida(int gameId) async {
    List<Education> educations = await EducationDao.getSavedEducations(gameId);
    Character character = (await CharacterDao.getCharacter(gameId))!;

    List<Map<String, dynamic>> savedGames = await Dao.readRows(
      'id = ?',
      _gamesTableName,
      [gameId],
    );

    return Vida.load(savedGames[0], character, educations);
  }

  /// Deletes a saved game from the database using its id and returns the number
  /// of games deleted. It should always delete only one row.
  static Future<int> deleteSavedGame(int gameId) async {
    return await Dao.delete(_gamesTableName, gameId);
  }
}
