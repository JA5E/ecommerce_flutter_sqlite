import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ecommerce_flutter/models/product_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'your_database.db');

    // Delete the database if it already exists
    await deleteDatabase(path);

    // Create the database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE Products (
        id INTEGER PRIMARY KEY,
        image TEXT,
        category TEXT,
        price INTEGER,
        ranking INTEGER,
        title TEXT,
        description TEXT,
        calories INTEGER,
        additives TEXT,
        vitamins TEXT
      )
    ''');
  }

  // Insert a product into the database
  Future<int> insertProduct(Product product) async {
    var dbClient = await db;
    return await dbClient!.insert('Products', product.toMap());
  }

  // Retrieve all products from the database
  Future<List<Product>> getProducts() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('Products');
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  // Update a product in the database
  Future<int> updateProduct(Product product) async {
    var dbClient = await db;
    return await dbClient!.update('Products', product.toMap(),
        where: 'id = ?', whereArgs: [product.id]);
  }

  // Delete a product from the database
  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('Products', where: 'id = ?', whereArgs: [id]);
  }

  // Close the database
  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }
}
