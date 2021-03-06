import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Favourite Conversation Model
class FavouriteData {
  final int? id;
  final String fromUnit;
  final String toUnit;
  final double conversionRate;
  FavouriteData(
      {  this.id,
        required this.fromUnit,
        required this.toUnit,
        required this.conversionRate});

  factory FavouriteData.fromMap(Map<String, dynamic> json) => FavouriteData(
      id: json["id"],
      fromUnit: json["fromUnit"],
      toUnit: json["toUnit"],
      conversionRate: json["conversionRate"],
     );

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'fromUnit': fromUnit,
      'toUnit': toUnit,
      'conversionRate': conversionRate
    };
  }
}

/// Database Services
class DataBaseHelper{
  DataBaseHelper.privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper.privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'favourites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  /// _onCreate function to create the database if non exists
  Future _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE favourites(
        id INTEGER PRIMARY KEY,
        fromUnit TEXT,
        toUnit TEXT,
        conversionRate REAL
      )
    ''');
  }
  /// Get all the favourites conversation stored in the database
  Future<List<FavouriteData>> getFavourites() async{
    Database db = await instance.database;
    var favourites = await db.query('favourites',orderBy: 'fromUnit');
    List<FavouriteData> favouriteList = favourites.isNotEmpty ? favourites.map((c) => FavouriteData.fromMap(c)).toList() : [];
    return favouriteList;
  }
  /// Add the favourite function to the database
  Future<int> add(FavouriteData favouriteData) async{
    Database db = await instance.database;
    return await db.insert('favourites',favouriteData.toMap());
  }
  /// Remove the conversation by id
  Future<int> remove(int id) async{
    Database db = await instance.database;
    return await db.delete('favourites', where: 'id = ?', whereArgs: [id]);
  }

}
