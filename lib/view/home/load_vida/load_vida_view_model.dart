import 'package:flutter/material.dart';
import 'package:vidas/config/app_routes.dart';
import 'package:vidas/config/get_it.dart';
import 'package:vidas/model/vida.dart';

import 'package:vidas/database/dao/vida_dao.dart';
import 'package:vidas/model/game_saving_slot.dart';

import 'package:vidas/database/dao/character_dao.dart';


class LoadVidaViewModel with ChangeNotifier {
  /// Retrieves a list of all saved games from the database.
  static Future<List<GameSavingSlot>> getAllSavedGames() async {
    return await VidaDao.getAllSavedGames();
  }

  /// Navigates to the [VidaView] loading the specified [Vida].
  static Future<void> loadGame(GameSavingSlot game, BuildContext context) async {

    Vida vida = await VidaDao.getVida(game.id);

    if (locator.isRegistered<Vida>()) {
      locator.unregister<Vida>();
    }

    setupLocator(vida: vida);
    AppRoutes.createVidaView(Navigator.of(context));
  }

  Future<bool> deleteGame(int gameId) async {
    await VidaDao.deleteSavedGame(gameId);
    // await EducationDao.deleteEducations(gameId);
    await CharacterDao.deleteCharacter(gameId);

    //TODO delete character, educations
    notifyListeners();
    return true;
  }
}
