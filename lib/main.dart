import 'package:flutter/material.dart';
import 'package:vidas/database/database_connection.dart';
import 'package:vidas/view/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  DatabaseConnection.instance.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vidas',
      // theme: AppThemes.aestheticTheme,
      home: HomeView(),
    );
  }
}
