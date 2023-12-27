// database_handler.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/contacts_model.dart';

class DatabaseHandler {
  static late Database _database;

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'contacts_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT, lastName TEXT, mobileNumber TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertContact(Contact contact) async {
    final db = await database;
    await db.insert('contacts', {
      'firstName': contact.firstName,
      'lastName': contact.lastName,
      'mobileNumber': contact.mobileNumber,
    });
  }

  Future<List<Contact>> getContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        mobileNumber: maps[i]['mobileNumber'],
      );
    });
  }

  Future<void> updateContact(Contact contact) async {
    final db = await database;
    await db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
