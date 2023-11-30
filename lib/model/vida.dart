import 'package:vidas/model/genders.dart';

class Vida {
  int? gameId;
  String name;
  Genders gender;
  int avatarId;
  int age;

  Vida({
    this.gameId,
    required this.name,
    required this.gender,
    required this.avatarId,
    required this.age,
  });

  Map<String, dynamic> toSqlMap() {
    return {
      'id': gameId,
      'name': name,
      'gender': gender.toString(),
      'age': age,
      'avatar_id': avatarId,
    };
  }

}
