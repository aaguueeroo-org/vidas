import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vidas/model/vida.dart';

import 'package:vidas/config/get_it.dart';
import 'package:vidas/view/education/education_view_model.dart';

/// Contains the logic for the main game view.
class VidaViewModel with ChangeNotifier {
  /// The [Vida] object that contains the game data.
  final Vida _vida = locator.get<Vida>();
  // Vida get vida => _vida;

  int get avatarId => _vida.character.avatarId;
  String get name => _vida.character.name;
  int get age => _vida.character.age;
  String get description => _vida.description;

  VidaViewModel();

  /// Sets the next year in the game and performs all actions that happen every
  /// year.
  ///
  /// Increases the age of the player and saves the game on multiples of 5.
  void nextYearPressed(BuildContext context) {
    EducationViewModel educationViewModel =
        Provider.of<EducationViewModel>(context, listen: false);

    _vida.advanceYear();

    if (age == 3) educationViewModel.startPreschool();
    if (age == 6) educationViewModel.startMiddleSchool();

    notifyListeners();
  }
}
