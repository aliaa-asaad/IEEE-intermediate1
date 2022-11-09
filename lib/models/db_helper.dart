import 'package:intermediate1/models/details.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String favTable = 'favorite';

class DBHelper {
  static final DBHelper instance = DBHelper.internal();

  factory DBHelper() => instance;

  DBHelper.internal();

  late Database db;

  Future<Database?> createDatabase() async {
    String? path = join(await getDatabasesPath(), 'favorite1.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('create table $favTable'
          ' (id INTEGER primary key autoincrement,'
          'name TEXT ,'
          'image TEXT ,'
          'isFav BOOLEAN )');
      print("Created");
    });
    return db;
  }

  Future<Details> insertFav(Details fav) async {
    fav.id = await db.insert(favTable, fav.toMap());
    return fav;
  }
  Future<int> deleteFav(int id) async {
    return await db.delete(favTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Details>> getAllFav() async {
    List<Map<String, dynamic>> favMaps = await db.query(favTable);
    if (favMaps.length == 0)
      return [];
    else {
      List<Details> favs = [];
      favMaps.forEach((element) {
        favs.add(Details.fromMap(element));
      });
      return favs;
    }
  }
}
