import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/home_view.dart';

import 'config/app_themes.dart';

final GlobalKey<NavigatorState> globalNavigationKey =
GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> dialogsNavigationKey =
GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize database
  // await DatabaseProvider.instance.database;

  runApp(MultiProvider(
    providers: const [],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigationKey,
      title: 'Vidas',
      theme: AppThemes.aestheticTheme,
      home: const HomeView(),
    );
  }
}
