import 'package:vidas/database/dao/dao.dart';

import 'package:vidas/model/education.dart';
import 'package:vidas/model/vida.dart';

class EducationDao {
  static const String _savedEducationsTable = 'GAME_EDUCATION';
  // static const String _educationTable = 'REPO_EDUCATION';

  //create
  static Future<Education> insertNewEducation(
    Education education,
    Vida vida,
  ) async {
    double grade = 5.0;
    int graduationYear =
        vida.currentYear + await _getDurationOfEducation(education);

    Map<String, dynamic> savedEducation = education.toSqlMapCreateMode();
    savedEducation['grade'] = grade;
    savedEducation['graduation_year'] = graduationYear;
    savedEducation['game_id'] = vida.id;

    int? educationId =
        await Dao.insertRow(_savedEducationsTable, savedEducation);

    Education newEducation = await getSavedEducationById(educationId!);

    return newEducation;
  }

  //read
  //TODO fix all queries with new names of the tables
  static Future<Education> getSavedEducationById(int id) async {
    List<Map<String, dynamic>> educationsMap = await Dao.rawQuery(
        'SELECT GAME_EDUCATION.ID, REPO_EDUCATION_LEVEL.name as level, GAME_EDUCATION.graduation_year, GAME_EDUCATION.grade, REPO_EDUCATION.field '
        'FROM GAME '
        'INNER JOIN GAME_EDUCATION '
        'ON GAME.id = GAME_EDUCATION.game_id '
        'INNER JOIN  EDUCATION '
        'ON GAME_EDUCATION.education_id = REPO_EDUCATION.id '
        'LEFT JOIN REPO_EDUCATION_LEVEL '
        'ON REPO_EDUCATION.level_id = REPO_EDUCATION_LEVEL.id '
        'WHERE GAME_EDUCATION.id = $id');

    return Education.fromSqlMap(educationsMap.first);
  }

  static Future<List<Education>> getSavedEducations(int? gameId) async {
    List<Map<String, dynamic>> educationsMap = await Dao.rawQuery(
        'SELECT GAME_EDUCATION.ID, REPO_EDUCATION_LEVEL.name as level, GAME_EDUCATION.graduation_year, GAME_EDUCATION.grade, REPO_EDUCATION.field '
        'FROM GAME '
        'INNER JOIN GAME_EDUCATION '
        'ON GAME.id = GAME_EDUCATION.game_id '
        'INNER JOIN REPO_EDUCATION '
        'ON GAME_EDUCATION.education_id = REPO_EDUCATION.id '
        'LEFT JOIN REPO_EDUCATION_LEVEL '
        'ON REPO_EDUCATION.level_id = REPO_EDUCATION_LEVEL.id '
        'WHERE GAME.id = $gameId');

    return educationsMap.map((e) => Education.fromSqlMap(e)).toList();
  }

  static Future<int> _getDurationOfEducation(Education education) async {
    List<Map<String, dynamic>> result = await Dao.rawQuery(
        'SELECT duration FROM REPO_EDUCATION_LEVEL WHERE name = ?',
        arguments: [education.level]);

    return result.first['duration'] as int;
  }

  static Future<List<Education>> getEducationsAvailable(int level) async {
    List<Map<String, dynamic>> educationsMap = await Dao.rawQuery(
        ' SELECT EDUCATION.id, FIELD, REPO_EDUCATION_LEVEL.name as level FROM EDUCATION '
        'LEFT JOIN REPO_EDUCATION_LEVEL '
        'ON EDUCATION.level_id = REPO_EDUCATION_LEVEL.id '
        'WHERE EDUCATION.level_id = $level ');

    return educationsMap.map((e) => Education.fromSqlMap(e)).toList();
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
