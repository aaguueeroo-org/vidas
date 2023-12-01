import 'package:flutter/material.dart';
import 'package:vidas/database/dao/storage_dao.dart';

import 'package:vidas/model/vida.dart';

class VidaViewModel with ChangeNotifier {
  Vida vida;

  VidaViewModel({
    required this.vida,
  });

  nextYearPressed() {
    vida.age++;

    notifyListeners();

    // Auto-save every 5 years
    if (vida.age % 5 == 0) _saveGame();
  }

  Future<void> _saveGame() async {
    await StorageDao.saveGame(vida.toSqlMap());
    debugPrint('Saved game with id: ${vida.id}');
  }
}
