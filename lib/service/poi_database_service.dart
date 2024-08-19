// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/poi.dart';

class POIDatabaseService {
  static final POIDatabaseService _instance = POIDatabaseService._internal();
  static Database? _database;

  factory POIDatabaseService() {
    return _instance;
  }

  POIDatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'poi_database.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE pois(id TEXT PRIMARY KEY, title TEXT, description TEXT, category TEXT, latitude REAL, longitude REAL)',
    );
  }

  Future<void> insertPOI(POI poi) async {
    final db = await database;
    await db.insert('pois', poi.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<POI>> getPOIs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pois');
    return List.generate(maps.length, (i) {
      return POI.fromMap(maps[i]);
    });
  }
}
