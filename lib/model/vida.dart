import 'package:vidas/model/genders.dart';

class Vida {
  int? id;
  String name;
  Genders gender;
  int avatarId;
  int age;

  Vida({
    this.id,
    required this.name,
    required this.gender,
    required this.avatarId,
    required this.age,
  });

  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender.toString(),
      'age': age,
      'avatar_id': avatarId,
    };
  }

  factory Vida.fromSqlMap(Map<String, dynamic> map) {
    return Vida(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: Genders.fromString(map['gender'] as String),
      age: map['age'] as int,
      avatarId: map['avatar_id'] as int,
    );
  }

  @override
  String toString() {
    return 'Vida{id: $id, name: $name, gender: $gender, age: $age, avatarId: $avatarId}';
  }

}
