
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  static DatabaseConnection instance = DatabaseConnection._();

  static const String _databaseName = 'vidas_repository.db';
  static const int _databaseVersion = 1;

  static Database? _database;

  Database? get database => _database;

  DatabaseConnection._() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    if (_database != null) return;

    // Copy the database from assets if it doesn't exist in the app directory
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, _databaseName);
    debugPrint('databasePath: $databasePath');
    final databaseFile = File(databasePath);

    if(!databaseFile.existsSync()) {
      await _copyDatabase(databasePath);
    }

    // Otherwise, open the database from the app directory
    _database = await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
    );
    debugPrint('Database opened');
  }

  Future<void> _copyDatabase(String databasePath) async {
    try {

      // Get a reference to the database asset file
      const assetPath = 'assets/$_databaseName';
      final ByteData data = await rootBundle.load(assetPath);

      // Write the data out to a file
      final Uint8List bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      final file = File(databasePath);
      await file.writeAsBytes(bytes, flush: true);
      debugPrint('Database copied');
    } catch (e) {
      debugPrint('Error copying the database: $e');
    }
  }

}
