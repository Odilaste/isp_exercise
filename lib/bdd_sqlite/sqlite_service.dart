import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    // Check if the database exists
    // print(path);
    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notes(id TEXT PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Etudiants(Matricule TEXT PRIMARY KEY AUTOINCREMENT, Noms TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(Note note) async {
    try {
      int result = 0;
      final Database db = await initializeDB();
      final id = await db.insert('Notes', note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      return id;
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
      return 1111; // 1111 est mon code personnel d'erreur
    }
  }

  Future<List<Note>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('Notes', orderBy: 'id'); //,
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  Future<List<Note>> get_One_Item(String Id) async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db
        .query('Notes', where: "id = ?", orderBy: 'id', whereArgs: [Id]); //,
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  // Delete an note by id
  Future<void> deleteItem(String id) async {
    final db = await initializeDB();
    try {
      await db.delete("Notes", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Update an note by id
  Future<void> UpdateItem(Note note, String ID) async {
    final db = await initializeDB();
    try {
      await db.update("Notes", note.toMap(), where: "id = ?", whereArgs: [ID]);
    } catch (err) {
      debugPrint("Something went wrong when updating an item: $err");
    }
  }
}
