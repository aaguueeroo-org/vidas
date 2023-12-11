import 'package:flutter/material.dart';

import 'package:vidas/database/dao/character_dao.dart';
import 'package:vidas/database/dao/education_dao.dart';
import 'package:vidas/database/dao/vida_dao.dart';
import 'package:vidas/model/character.dart';
import 'package:vidas/model/education.dart';

/// Represents one game. Includes all the variables for a game state.
class Vida {
  /// The id of the game in the database.
  int id;

  /// The current year in the game.
  late int currentYear = DateTime.now().year;

  /// The character of the player.
  Character character;

  /// The educations of the player.
  List<Education> educations = const [];

  String get description {
    return educations.isEmpty
        ? character.gender.toString()
        : educations.last.level;
  }

  Vida.newGame({
    required this.id,
    required this.character,
  });

  Vida._loadGame({
    required this.id,
    required this.currentYear,
    required this.character,
    required this.educations,
  });

  void advanceYear() {
    currentYear++;
    character.growOlder();
    for (var education in educations) {
      education.advanceYear(currentYear);
    }

    // Auto-save every 5 years
    if (character.age % 5 == 0) {
      saveGame();
    }
  }

  Future<bool> saveGame() async {
    try{
      await VidaDao.saveGame(this);
      await CharacterDao.saveCharacter(character);
      for (Education education in educations) {
        await EducationDao.saveEducation(education, id);
      }

      debugPrint('Saved game with id: $id');
      return true;

    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// Translates the game information into a map that can be inserted into the
  /// database. The keys of the map correspond to the column names in the
  /// database.
  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'current_year': currentYear,
    };
  }

  /// Creates a new game from a map that was retrieved from the database. The
  /// variables are assigned the values from the table columns.
  factory Vida.load(
    Map<String, dynamic> map,
    Character character,
    List<Education> educations,
  ) {
    //TODO get from db
    return Vida._loadGame(
      id: map['id'] as int,
      currentYear: map['current_year'] as int,
      character: character,
      educations: educations,
    );
  }

  /// Returns a string representation of the game state.
  @override
  String toString() {
    return 'Vida: $id, $currentYear, $character, $educations';
  }
}
