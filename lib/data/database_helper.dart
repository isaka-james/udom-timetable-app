import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit(); // Initialize sqflite_ffi

    // Set databaseFactory for sqflite_common_ffi
    databaseFactory = databaseFactoryFfi;

    // Get the application documents directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'udom_timetable_app.db');
    // print('Database path: $path'); // Log database path

    try {
      // Ensure the directory exists
      if (!await Directory(documentsDirectory.path).exists()) {
        await Directory(documentsDirectory.path).create(recursive: true);
      }

      // Open the database
      return await openDatabase(
        path,
        version: 1,
        onCreate: onCreateDB,
        onOpen: (db) {
          print('Database opened(on openDatabase onCreateDB): $db');
        },
      );
    } catch (e) {
      print(
          'Error initializing database(on openDatabase onCreateDB): $e'); // Log initialization error
      rethrow;
    }
  }

  void onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE COARSE (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        coarse_short TEXT UNIQUE,
        coarse_long TEXT,
        teacher TEXT
      )
      ''');

    await db.execute('''
      CREATE TABLE TIMETABLE (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        timetable TEXT,
        time_start TEXT,
        time_end TEXT,
        coarse_short TEXT,
        classes TEXT,
        status TEXT,
        venue TEXT,
        FOREIGN KEY (coarse_short) REFERENCES COARSE (coarse_short)
      )
    ''');

    await db.execute('''
      CREATE TABLE NOTIFICATIONS (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pushed TEXT,
        for TEXT,
        message TEXT,
        header TEXT,
        coarse_short TEXT,
        date TEXT,
        FOREIGN KEY (coarse_short) REFERENCES COARSE (coarse_short)
      )
    ''');

    await db.execute('''
      CREATE TABLE LOCALHOST (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        last_synchronous TEXT,
        programme TEXT,
        year INTEGER,
        college TEXT,
        update_link TEXT
      )
    ''');
  }

  // method that deletes all tables and migrates the database down,
  Future<void> migrateDownDatabase() async {
    // Get the path to the database file
    String path = join(await getDatabasesPath(), 'udom_timetable_app.db');

    // Close the existing database if it's open
    if (_database != null && _database!.isOpen) {
      print("database was closed: on migrateDownDatabase()");
      await _database!.close();
    }

    // Delete the database file
    await deleteDatabase(path);

    // Reinitialize the database
    _database = await _initDatabase();
  }

  // Clear all datas
  Future<void> clearAllData() async {
    Database db = await instance.database;

    // Delete all data from COARSE table
    await db.delete('COARSE');

    // Delete all data from TIMETABLE table
    await db.delete('TIMETABLE');

    // Delete all data from NOTIFICATIONS table
    await db.delete('NOTIFICATIONS');

    // Delete all data from LOCALHOST table
    await db.delete('LOCALHOST');
  }

  // CRUD Operations for COARSE
  Future<int> insertCoarse(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('COARSE', row);
  }

  Future<List<Map<String, dynamic>>> queryAllCoarse() async {
    Database db = await instance.database;
    return await db.query('COARSE');
  }

  Future<int> updateCoarse(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String id = row['coarse_short'];
    return await db
        .update('COARSE', row, where: 'coarse_short = ?', whereArgs: [id]);
  }

  Future<int> deleteCoarse(String id) async {
    Database db = await instance.database;
    return await db
        .delete('COARSE', where: 'coarse_short = ?', whereArgs: [id]);
  }

  // CRUD Operations for TIMETABLE
  Future<int> insertTimetable(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('TIMETABLE', row);
  }

  Future<List<Map<String, String?>>> queryTimetableForDate(
      DateTime selectedDate) async {
    Database db = await instance.database;
    String formattedDate = selectedDate
        .toIso8601String()
        .split('T')[0]; // Get selected date in 'YYYY-MM-DD' format

    // Query the database for entries with the selected date
    List<Map<String, dynamic>> result = await db.query(
      'TIMETABLE',
      where: 'date = ?',
      whereArgs: [formattedDate],
    );

    // Convert the result to a list of maps with string keys and nullable string values
    List<Map<String, String?>> convertedResult = result.map((map) {
      Map<String, String?> convertedMap = {};
      map.forEach((key, value) {
        convertedMap[key] = value.toString();
      });
      return convertedMap;
    }).toList();

    return convertedResult;
  }

  Future<Map<String, dynamic>> queryTimetableForId(int id) async {
    Database db = await instance.database;

    // Query the database for the entry with the specified ID
    List<Map<String, dynamic>> result = await db.query(
      'TIMETABLE',
      where: 'id = ?',
      whereArgs: [id],
    );

    // Return the first entry (assuming there's only one entry with the specified ID)
    return result.first;
  }

  Future<int> updateTimetable(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('TIMETABLE', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTimetable(int id) async {
    Database db = await instance.database;
    return await db.delete('TIMETABLE', where: 'id = ?', whereArgs: [id]);
  }

  // CRUD Operations for NOTIFICATIONS
  Future<int> insertNotification(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('NOTIFICATIONS', row);
  }

  Future<List<Map<String, dynamic>>> queryAllNotifications() async {
    Database db = await instance.database;
    return await db.query('NOTIFICATIONS');
  }

  Future<int> updateNotification(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db
        .update('NOTIFICATIONS', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteNotification(int id) async {
    Database db = await instance.database;
    return await db.delete('NOTIFICATIONS', where: 'id = ?', whereArgs: [id]);
  }

  // CRUD Operations for LOCALHOST
  Future<int> insertLocalhost(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('LOCALHOST', row);
  }

  Future<List<Map<String, dynamic>>> queryAllLocalhost() async {
    Database db = await instance.database;
    return await db.query('LOCALHOST');
  }

  Future<int> updateLocalhost(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('LOCALHOST', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteLocalhost(int id) async {
    Database db = await instance.database;
    return await db.delete('LOCALHOST', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }

  Future<void> populateDatabase() async {
    Database db = await instance.database;

    // Sample data for COARSE table
    List<Map<String, dynamic>> coarseData = [
      {'coarse_short': 'C1', 'coarse_long': 'Course 1', 'teacher': 'Mr. A'},
      {'coarse_short': 'C2', 'coarse_long': 'Course 2', 'teacher': 'Mr. B'},
      // Add more coarse data here...
    ];

    // Sample data for TIMETABLE table
    List<Map<String, dynamic>> timetableData = [
      {
        'id': 1,
        'date': '2024-07-17',
        'timetable': 'Sample Timetable 1',
        'time_start': '01:00 PM',
        'time_end': '02:00 AM',
        'coarse_short': 'C1',
        'classes': 'Class A',
        'status': 'Status A',
        'venue': 'Venue A'
      },
      {
        'id': 2,
        'date': '2024-07-17',
        'timetable': 'Sample Timetable 2',
        'time_start': '02:30 AM',
        'time_end': '04:30 AM',
        'coarse_short': 'C2',
        'classes': 'Class B',
        'status': 'Status B',
        'venue': 'Venue B'
      },
      // Add more timetable data here...
    ];

    // Sample data for NOTIFICATIONS table
    List<Map<String, dynamic>> notificationsData = [
      {
        'id': 1,
        'pushed': "true",
        'for': 'Recipient A',
        'message': 'Notification Message A',
        'header': 'Notification Header A',
        'coarse_short': 'C1',
        'date': '2024-07-17'
      },
      {
        'id': 2,
        'pushed': "true",
        'for': 'Recipient B',
        'message': 'Notification Message B',
        'header': 'Notification Header B',
        'coarse_short': 'C2',
        'date': '2024-07-18'
      },
      // Add more notifications data here...
    ];

    // Sample data for LOCALHOST table
    List<Map<String, dynamic>> localhostData = [
      {
        'last_synchronous': '2024-05-24',
        'programme': 'Programme A',
        'year': 2,
        'college': 'College A',
        'update_link': 'Update A'
      },
    ];

    // Insert data into COARSE table
    for (var entry in coarseData) {
      await db.insert('COARSE', entry);
    }

    // Insert data into TIMETABLE table
    for (var entry in timetableData) {
      await db.insert('TIMETABLE', entry);
    }

    // Insert data into NOTIFICATIONS table
    for (var entry in notificationsData) {
      await db.insert('NOTIFICATIONS', entry);
    }

    // Insert data into LOCALHOST table
    for (var entry in localhostData) {
      await db.insert('LOCALHOST', entry);
    }
  }
}
