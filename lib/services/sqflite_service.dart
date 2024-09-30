import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// A service class to interact with the SQLite database.
class SqfliteService {
  static late Database database;

  SqfliteService._();

  /// Initializes the SQLite database.
  ///
  /// Creates a new database if it doesn't exist, or opens an existing one.
  ///
  /// Returns a [Future] that completes when the database is initialized.
  static Future initDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'worldline.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pois(id TEXT PRIMARY KEY, title TEXT, imageUrl TEXT, geocoordinates TEXT)',
        );
      },
      version: 1,
    );

    SqfliteService.database = database;
  }

  /// Inserts a new POI into the database.
  ///
  /// [map] is a map of column names to values.
  ///
  /// Returns a [Future] that completes when the insertion is successful.
  static Future insert(Map<String, Object?> map) async {
    await SqfliteService.database.insert(
      'pois',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieves a list of POIs from the database.
  ///
  /// [table] is the name of the table to retrieve from.
  ///
  /// Returns a [Future] that completes with a list of maps, where each map represents a row in the table.
  static Future<List<Map<String, Object?>>> retrieve(String table) async {
    final data = await SqfliteService.database.query(table);
    return data;
  }
}
