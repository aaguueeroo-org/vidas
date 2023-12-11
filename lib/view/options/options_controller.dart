import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vidas/model/vida.dart';

import 'package:vidas/view/home/home_view.dart';


/// Contains the logic for all the options.
class OptionsController {
  OptionsController();

  /// Saves the game to the database.
  static Future<void> saveGame() async {
    GetIt.instance.get<Vida>().saveGame();
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
