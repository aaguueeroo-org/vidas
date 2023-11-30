import 'package:flutter/widgets.dart';
import 'package:vidas/database/dao/storage_dao.dart';

class HomeController {

  static Future<void> startGame(BuildContext context) async {

    Map<String, dynamic> newGame = {
      'name': 'Julia',
      'age': 0,
    };

    await StorageDao.saveNewGame(newGame);
    debugPrint('Game saved!');

  }

  static Future<void> loadGame(BuildContext context) async {
    debugPrint((await StorageDao.getAllSavedGames()).toString());
  }

}