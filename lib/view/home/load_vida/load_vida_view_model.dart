import 'package:flutter/material.dart';
import 'package:vidas/model/vida.dart';

import 'package:vidas/database/dao/storage_dao.dart';

class LoadVidaViewModel with ChangeNotifier {

  Future<List<Vida>> getAllSavedGames() async {
    debugPrint((await StorageDao.getAllSavedGames()).toString());
    return await StorageDao.getAllSavedGames();
  }

  Future<void> deleteGame(int vidaId) async {
    debugPrint((await StorageDao.deleteSavedGame(vidaId)).toString());
    notifyListeners();
  }



}