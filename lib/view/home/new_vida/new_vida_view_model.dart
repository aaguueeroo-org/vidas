import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/database/dao/storage_dao.dart';
import 'package:vidas/model/genders.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/view/vida/vida_view.dart';

import 'package:vidas/view/vida/vida_view_model.dart';

class NewVidaViewModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();

  Genders _selectedGender = Genders.male;
  Genders get selectedGender => _selectedGender;
  set selectedGender(Genders gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  int _selectedAvatar = 0;
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

  void changeAvatar(bool bool) {
    if (bool) {
      _selectedAvatar++;
      if (_selectedAvatar > 19) {
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

    final navigator = Navigator.of(context);

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

      navigator.pushReplacement(
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => VidaViewModel(vida: newVida),
            child: const VidaView(),
          ),
        ),
      );
    } else {
      debugPrint('Game not saved!');
    }
  }

  void clear() {
    nameController.clear();
    _selectedAvatar = 0;
    _selectedGender = Genders.male;
    _ambitiousPassiveSlider = 0.5;
    _extrovertedIntrovertedSlider = 0.5;
    _activeRelaxedSlider = 0.5;
  }
}
