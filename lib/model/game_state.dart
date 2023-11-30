import 'package:flutter/material.dart';

import 'package:vidas/model/genders.dart';

class GameState with ChangeNotifier {
  int gameId;
  String name;
  late int age;
  Genders gender;
  int avatarId;

  GameState.newGame(
    this.gameId,
    this.name,
    this.gender,
    this.avatarId,
  ) {
    age = 0;
  }
}
