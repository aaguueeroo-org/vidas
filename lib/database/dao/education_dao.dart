import 'package:vidas/database/dao/dao.dart';
import 'package:vidas/model/education.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/model/education_repo_item.dart';

class EducationDao {
  static const String _savedEducationsTable = 'GAME_EDUCATION';
  // static const String _educationTable = 'REPO_EDUCATION';

  /// Inserts a new row into the table GAME_EDUCATION. The row contains the
  /// education id, the game id, the graduation year and the grade.
  static Future<int?> insertNewEducation(
    EducationRepoItem education,
    Vida vida,
  ) async {
    Map<String, dynamic> newEducationMap = {
      'education_id': education.id,
      'game_id': vida.id,
      'graduation_year': vida.currentYear + education.duration,
    };

    return await Dao.insertRow(_savedEducationsTable, newEducationMap);
  }

  //read
  static Future<Education> getSavedEducationById(int id) async {
    List<Map<String, dynamic>> educationsMap = await Dao.rawQuery(
        'SELECT GAME_EDUCATION.ID, REPO_EDUCATION_LEVEL.name as level, GAME_EDUCATION.graduation_year, GAME_EDUCATION.grade, REPO_EDUCATION.field, GAME_EDUCATION.is_enrolled, GAME_EDUCATION.is_enrolled '
        'FROM GAME '
        'INNER JOIN GAME_EDUCATION '
        'ON GAME.id = GAME_EDUCATION.game_id '
        'INNER JOIN REPO_EDUCATION '
        'ON GAME_EDUCATION.education_id = REPO_EDUCATION.id '
        'LEFT JOIN REPO_EDUCATION_LEVEL '
        'ON REPO_EDUCATION.level_id = REPO_EDUCATION_LEVEL.id '
        'WHERE GAME_EDUCATION.id = $id');

    return Education.fromSaved(educationsMap.first);
  }

  static Future<List<Education>> getSavedEducations(int? gameId) async {
    List<Map<String, dynamic>> educationsMap = await Dao.rawQuery(
        'SELECT GAME_EDUCATION.ID, REPO_EDUCATION_LEVEL.name as level, GAME_EDUCATION.graduation_year, GAME_EDUCATION.grade, REPO_EDUCATION.field, GAME_EDUCATION.is_enrolled '
        'FROM GAME '
        'INNER JOIN GAME_EDUCATION '
        'ON GAME.id = GAME_EDUCATION.game_id '
        'INNER JOIN REPO_EDUCATION '
        'ON GAME_EDUCATION.education_id = REPO_EDUCATION.id '
        'LEFT JOIN REPO_EDUCATION_LEVEL '
        'ON REPO_EDUCATION.level_id = REPO_EDUCATION_LEVEL.id '
        'WHERE GAME.id = $gameId');

    return educationsMap.map((e) => Education.fromSaved(e)).toList();
  }

  static Future<List<EducationRepoItem>> getEducationsAvailable(
      int level) async {
    List<Map<String, dynamic>> educationsMap = await Dao.rawQuery(
        'SELECT REPO_EDUCATION.id as education_id, FIELD, REPO_EDUCATION_LEVEL.name as level, REPO_EDUCATION_LEVEL.duration '
        'FROM REPO_EDUCATION '
        'LEFT JOIN REPO_EDUCATION_LEVEL '
        'ON REPO_EDUCATION.level_id = REPO_EDUCATION_LEVEL.id '
        'WHERE REPO_EDUCATION.level_id = $level ');

    return educationsMap.map((e) => EducationRepoItem.fromRepo(e)).toList();
  }

  static Future<int> getDurationOfEducation(Education education) async {
    List<Map<String, dynamic>> result = await Dao.readRows(
      'name',
      'REPO_EDUCATION_LEVEL',
      [education.levelName],
      columns: ['duration'],
    );

    return result.first['duration'] as int;
  }

  //update
  static Future<int> saveEducation(Education education, int gameId) async {
    Map<String, dynamic> educationMap = education.toSqlMapSaveMode();
    educationMap['game_id'] = gameId;

    return await Dao.update(_savedEducationsTable, educationMap);
  }

  //delete
  static Future<int> deleteEducation(int id) async {
    return await Dao.delete(_savedEducationsTable, id);
  }
}
