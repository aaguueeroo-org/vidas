import 'package:flutter/material.dart';
import 'package:vidas/model/vida.dart';

import 'package:vidas/database/dao/storage_dao.dart';
import 'package:vidas/view/home/home_view.dart';

/// Contains the logic for all the options.
class OptionsController {

  /// Saves the game to the database.
  static Future<void> saveGame(Vida vida) async {
    await StorageDao.saveGame(vida.toSqlMap());
    debugPrint('Saved game with id: ${vida.id}');
  }

  /// Quits the game and returns to the home view.
  static void quitGame(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomeView(),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
