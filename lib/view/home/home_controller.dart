import 'package:flutter/widgets.dart';
import 'package:vidas/database/dao/storage_dao.dart';

class HomeController {

  static Future<void> loadGame(BuildContext context) async {
    debugPrint((await StorageDao.getAllSavedGames()).toString());
  }

}