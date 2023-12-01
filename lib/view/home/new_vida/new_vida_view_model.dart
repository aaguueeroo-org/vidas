import 'package:flutter/material.dart';
import 'package:vidas/config/app_routes.dart';
import 'package:vidas/database/dao/storage_dao.dart';
import 'package:vidas/model/genders.dart';
import 'package:vidas/model/vida.dart';

/// Contains the logic for the [NewVidaDialog].
class NewVidaViewModel with ChangeNotifier {

  /// The number of avatars available to loop through in the dialog.
  static const numberOfAvatars = 19;

  /// The controller for the name text field in the dialog.
  TextEditingController nameController = TextEditingController();

  /// The controller for the dropdown of [Genders] in the dialog.
  Genders _selectedGender = Genders.male;

  /// Gets the gender selected in the dropdown of [Genders] in the dialog.
  Genders get selectedGender => _selectedGender;

  /// Sets the gender in the [Genders] dropdown in the dialog and notifies
  /// listeners of the change.
  set selectedGender(Genders gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  /// Controller for the avatar image showing in the dialog.
  int _selectedAvatar = 0;

  /// Gets the index of the avatar image showing in the dialog.
  int get selectedAvatar => _selectedAvatar;

  /// First slider value in [NewVidaDialog] that determines the Vida's
  /// ambitious/passive personality trait.
  double _ambitiousPassiveSlider = 0.5;
  double get ambitiousPassive => _ambitiousPassiveSlider;
  set ambitiousPassive(double value) {
    _ambitiousPassiveSlider = value;
    notifyListeners();
  }

  double getAmbitiousTrait() => _ambitiousPassiveSlider;
  double getPassiveTrait() => 1 - _ambitiousPassiveSlider;

  /// Second slider value in [NewVidaDialog] that determines the Vida's
  /// extroverted/introverted personality trait.
  double _extrovertedIntrovertedSlider = 0.5;
  double get extrovertedIntroverted => _extrovertedIntrovertedSlider;
  set extrovertedIntroverted(double value) {
    _extrovertedIntrovertedSlider = value;
    notifyListeners();
  }

  double getExtrovertedTrait() => _extrovertedIntrovertedSlider;
  double getIntrovertedTrait() => 1 - _extrovertedIntrovertedSlider;

  /// Third slider value in [NewVidaDialog] that determines the Vida's
  /// active/relaxed personality trait.
  double _activeRelaxedSlider = 0.5;
  double get activeRelaxed => _activeRelaxedSlider;
  set activeRelaxed(double value) {
    _activeRelaxedSlider = value;
    notifyListeners();
  }

  double getActiveTrait() => _activeRelaxedSlider;
  double getRelaxedTrait() => 1 - _activeRelaxedSlider;

  void randomizeVidaParameters() {
    //TODO implement
  }

  /// Changes the avatar showing in the dialog by increasing or decreasing the
  /// index of the avatar image depending on a boolean. If the index reaches
  /// the maximum number of avatars or the minimum, it resets as a loop.
  void changeAvatar(bool increasing) {
    if (increasing) {
      _selectedAvatar++;
      if (_selectedAvatar > numberOfAvatars) {
        _selectedAvatar = 0;
      }
    } else {
      _selectedAvatar--;
      if (_selectedAvatar < 0) {
        _selectedAvatar = 19;
      }
    }
    notifyListeners();
  }

  /// Creates a new game by using the parameters in the dialog and navigates to
  /// the [VidaView] loading the new game. The new game is stored in the
  /// database.
  Future<void> newGame(BuildContext context) async {
    //TODO fix this -> snackBar is behind dialog
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a name'),
        ),
      );
      return;
    }

    final NavigatorState navigator = Navigator.of(context);

    Vida newVida = Vida(
      name: nameController.text,
      gender: _selectedGender,
      avatarId: _selectedAvatar,
      age: 0,
    );

    int? vidaId = await StorageDao.createNewGame(newVida.toSqlMap());

    newVida.id = vidaId;

    if (vidaId != null) {
      debugPrint('Game saved! id = $vidaId');
      AppRoutes.createVidaView(navigator, newVida);
    } else {
      debugPrint('Game not saved!');
    }
  }

  /// Clears all fields in the dialog.
  void clear() {
    nameController.clear();
    _selectedAvatar = 0;
    _selectedGender = Genders.male;
    _ambitiousPassiveSlider = 0.5;
    _extrovertedIntrovertedSlider = 0.5;
    _activeRelaxedSlider = 0.5;
  }
}
