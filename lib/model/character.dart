import 'package:vidas/model/genders.dart';

class Character {
  /// The id of the player.
  int? id;

  /// The name of the player.
  String name;

  /// The gender of the player.
  Genders gender;

  /// The avatar number of the player.
  int avatarId;

  /// The age of the player.
  int age;

  /// Creates a new person with the given parameters.
  Character({
    this.id,
    required this.name,
    required this.gender,
    required this.avatarId,
    this.age = 0,
  });

  void growOlder() {
    age++;
  }

  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender.toString(),
      'avatar_id': avatarId,
      'age': age,
    };
  }

  factory Character.fromSqlMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'],
      gender: Genders.fromString(map['gender']),
      avatarId: map['avatar_id'] as int,
      age: map['age'] as int,
    );
  }
}
