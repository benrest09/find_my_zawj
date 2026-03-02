import 'package:find_my_zawj/models/usermodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'my_zawj.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE siswa (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
        );
        await db.execute(
          'CREATE TABLE pengguna (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur INT, domisili TEXT, jenis_kelamin TEXT, tanggal_lahir TEXT)',
        );
      },
      version: 3,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          await db.execute(
            'CREATE TABLE pengguna (id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur INT, domisili TEXT, jenis_kelamin TEXT, tanggal_lahir TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('user', user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
