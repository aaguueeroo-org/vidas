import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/database/database_connection.dart';
import 'package:vidas/view/home/home_view_model.dart';
import 'package:vidas/view/home/home_view.dart';

import 'config/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  DatabaseConnection.instance.database;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vidas',
      theme: AppThemes.aestheticTheme,
      home: const HomeView(),
    );
  }
}
