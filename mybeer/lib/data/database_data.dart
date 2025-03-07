import 'package:mybeer/model/beer.dart';
import 'package:mybeer/model/beer_type.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'flutter_sqflite_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {breeds} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE beer_types(id INTEGER PRIMARY KEY, name TEXT, description TEXT)',
    );
    // Run the CREATE {dogs} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE beers(id INTEGER PRIMARY KEY, name TEXT, color INTEGER, typeId INTEGER, FOREIGN KEY (typeId) REFERENCES beer_types(id) ON DELETE SET NULL)',
    );
  }

  // Define a function that inserts beer types into the database
  Future<void> insertBeerType(BeerType beerType) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the BeerType into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same beer type is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'beer_types',
      beerType.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertBeer(Beer beer) async {
    final db = await _databaseService.database;
    await db.insert(
      'beers',
      beer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the breeds from the breeds table.
  Future<List<BeerType>> beerTypes() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query('beer_types');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => BeerType.fromMap(maps[index]));
  }

  Future<BeerType> beerType(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'beer_types',
      where: 'id = ?',
      whereArgs: [id],
    );
    return BeerType.fromMap(maps[0]);
  }

  Future<List<Beer>> beers() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('beers');
    return List.generate(maps.length, (index) => Beer.fromMap(maps[index]));
  }

  // A method that updates a breed data from the breeds table.
  Future<void> updateBeerType(BeerType beerType) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      'beer_types',
      beerType.toMap(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [beerType.id],
    );
  }

  Future<void> updateBeer(Beer beer) async {
    final db = await _databaseService.database;
    await db.update(
      'beers',
      beer.toMap(),
      where: 'id = ?',
      whereArgs: [beer.id],
    );
  }

  // A method that deletes a beer type from the database.
  Future<void> deleteBeerType(int id) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the BeerType from the database.
    await db.delete(
      'beer_types',
      // Use a `where` clause to delete a specific beer type.
      where: 'id = ?',
      // Pass the BeerType's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteBeer(int id) async {
    final db = await _databaseService.database;
    await db.delete('beers', where: 'id = ?', whereArgs: [id]);
  }
}
