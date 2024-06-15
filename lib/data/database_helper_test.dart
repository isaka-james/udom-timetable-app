import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit(); // Initialize sqflite_ffi

    // Set databaseFactory for sqflite_common_ffi
    databaseFactory = databaseFactoryFfi;

    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my_database.db');
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Test (
        id INTEGER PRIMARY KEY,
        name TEXT,
        value INTEGER,
        num REAL
      )
    ''');
  }

  Future<int> insert(String name, int value, double num) async {
    Database db = await database;
    return await db.insert('Test', {'name': name, 'value': value, 'num': num});
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await database;
    return await db.query('Test');
  }
}
