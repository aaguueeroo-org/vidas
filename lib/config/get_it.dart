import 'package:get_it/get_it.dart';

import 'package:vidas/model/vida.dart';

final locator = GetIt.instance;

void setupLocator({
  required Vida vida,
}) {
  locator.registerLazySingleton<Vida>(() => vida);
}
