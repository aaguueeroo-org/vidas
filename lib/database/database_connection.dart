
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Manages the initialization of the database.
///
/// The database with the full information necessary for the gameplay (different
/// educations, jobs, npcs, etc) is included in the installation of the app.
/// When the app is run, this class checks if the database exists on the device.
/// If it doesn't, it copies it to the device directory from the assets folder.
/// If it does, it opens it.
class DatabaseConnection {

  /// The singleton instance of [DatabaseConnection].
  static DatabaseConnection instance = DatabaseConnection._();

  /// The name of the database file.
  static const String _databaseName = 'vidas_repository.db';

  /// The version of the database.
  static const int _databaseVersion = 1;

  /// The [_database] instance.
  static Database? _database;

  /// Returns the [_database] instance if it exists.
  Database? get database => _database;

  /// Private constructor for the singleton that initializes the database.
  DatabaseConnection._() {
    _initializeDatabase();
  }

  /// Initializes the database.
  ///
  /// If the database does not exist in the app directory, it will be copied
  /// from the assets directory. Otherwise, it will be opened.
  Future<void> _initializeDatabase() async {
    if (_database != null) return;

    // Get the database path
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, _databaseName);

    // Copy the database from assets if the file doesn't exist
    if(!File(databasePath).existsSync()) {
      await _copyDatabase(databasePath);
    }

    // Otherwise, open the database
    _database = await openDatabase(
      databasePath,
      version: _databaseVersion,
    );
  }

  /// Copies the database from the assets folder to the device directory.
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
    } catch (e) {
      debugPrint('Error copying the database: $e');
    }
  }

}
