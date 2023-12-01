import 'package:flutter/material.dart';
import 'package:vidas/model/vida.dart';

import 'package:vidas/database/dao/storage_dao.dart';

class LoadVidaViewModel with ChangeNotifier {

  /// Retrieves a list of all saved games from the database.
  Future<List<Vida>> getAllSavedGames() async {
    debugPrint((await StorageDao.getAllSavedGames()).toString());
    return await StorageDao.getAllSavedGames();
  }

  /// Deletes a saved game from the database and returns the number of games
  /// deleted.
  Future<int> deleteGame(int vidaId) async {
    int gamesDeleted = await StorageDao.deleteSavedGame(vidaId);
    notifyListeners();
    return gamesDeleted;
  }



}