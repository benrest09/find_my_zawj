import 'package:find_my_zawj/database/sqflite.dart';
import 'package:find_my_zawj/models/profil_model.dart';

class PenggunaController {
  static Future<void> registerPengguna(PenggunaModel pengguna) async {
    final dbs = await DBHelper.db();
    await dbs.insert('pengguna', pengguna.toMap());
    print(pengguna.toMap());
  }

  static Future<List<PenggunaModel>> getAllPengguna() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("pengguna");
    print(results.map((e) => PenggunaModel.fromMap(e)).toList());
    return results.map((e) => PenggunaModel.fromMap(e)).toList();
  }
}
