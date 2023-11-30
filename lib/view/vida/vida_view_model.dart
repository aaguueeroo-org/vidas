import 'package:flutter/material.dart';

import 'package:vidas/model/genders.dart';

class VidaViewModel with ChangeNotifier {
  int gameId;
  String name;
  Genders gender;
  int avatarId;
  int age;

  VidaViewModel({
    required this.gameId,
    required this.name,
    required this.gender,
    required this.avatarId,
    required this.age,
  });

  nextYearPressed() {
    age++;
    notifyListeners();
  }


}
