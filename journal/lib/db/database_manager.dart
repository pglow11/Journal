import 'package:flutter/services.dart';
import 'package:journal/db/journal_entry_dto.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_INSERT =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES (?, ?, ?, ?);';

  static late DatabaseManager _instance;
  final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initalize() async {
    // TESTING ONLY - START
    // await deleteDatabase(DATABASE_FILENAME);
    // TESTING ONLY - END
    final db = await openDatabase(DATABASE_FILENAME, version: 1,
        onCreate: (Database db, int version) async {
      createTables(
          db, await rootBundle.loadString('assets/files/schema_1.sql.txt'));
    });
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryDTO dto}) {
    db.transaction((txn) async {
      await txn.rawInsert(
          SQL_INSERT, [dto.title, dto.body, dto.rating, dto.date.toString()]);
    });
  }
}
