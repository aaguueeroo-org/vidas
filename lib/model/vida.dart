import 'package:vidas/model/genders.dart';

/// Represents one game. Includes all the variables for a game state.
class Vida {

  /// The id of the game in the database.
  int? id;

  /// The name of the player.
  String name;

  /// The gender of the player.
  Genders gender;

  /// The avatar number of the player.
  int avatarId;

  /// The age of the player.
  int age;

  /// Creates a new game with the given parameters. [id] is optional because
  /// it does not exist until the game is saved to the database, but it should
  /// always be updated after inserting the new game into the database.
  Vida({
    this.id,
    required this.name,
    required this.gender,
    required this.avatarId,
    required this.age,
  });

  /// Translates the game information into a map that can be inserted into the
  /// database. The keys of the map correspond to the column names in the
  /// database.
  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender.toString(),
      'age': age,
      'avatar_id': avatarId,
    };
  }

  /// Creates a new game from a map that was retrieved from the database. The
  /// variables are assigned the values from the table columns.
  factory Vida.fromSqlMap(Map<String, dynamic> map) {
    return Vida(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: Genders.fromString(map['gender'] as String),
      age: map['age'] as int,
      avatarId: map['avatar_id'] as int,
    );
  }

  /// Returns a string representation of the game state.
  @override
  String toString() {
    return 'Vida{id: $id, name: $name, gender: $gender, age: $age, avatarId: $avatarId}';
  }

}
