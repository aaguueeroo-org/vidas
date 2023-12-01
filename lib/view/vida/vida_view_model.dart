import 'package:flutter/material.dart';

import 'package:vidas/model/vida.dart';

import 'package:vidas/view/options/options_controller.dart';

/// Contains the logic for the main game view.
class VidaViewModel with ChangeNotifier {

  /// The [Vida] object that contains the game data.
  Vida vida;

  /// Creates a new [VidaViewModel] with the given [vida].
  VidaViewModel({
    required this.vida,
  });

  /// Sets the next year in the game and performs all actions that happen every
  /// year.
  ///
  /// Increases the age of the player and saves the game on multiples of 5.
  nextYearPressed() {
    vida.age++;

    notifyListeners();

    // Auto-save every 5 years
    if (vida.age % 5 == 0) OptionsController.saveGame(vida);
  }

}
