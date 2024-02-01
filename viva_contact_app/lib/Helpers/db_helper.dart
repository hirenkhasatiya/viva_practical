import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class DbHelper {
  DbHelper._() {
    init();
  }
  static final DbHelper dbhelper = DbHelper._();

  String tableName = 'contactstable';
  String Id = '';
  String name = 'name';
  String number = 'number';
  String query = '';

  Logger logger = Logger();
  late Database database;

  Future<void> init() async {
    String dbPath = await getDatabasesPath();
    String dbName = "db_contact.db";
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        query =
            "CREATE TABLE IF NOT EXISTS $tableName($Id INTEGER PRIMARY KEY AUTOINCREMENT,$name TEXT,$number TEXT)";
        db
            .execute(query)
            .then((value) => logger.i("Table created..."))
            .onError((error, stackTrace) => logger.e("ERROR: $error"));
      },
    );
  }

  Future<int> insertcontact({required ContactModal contact}) async {
    return await database.insert(tableName, contact.toMap);
  }

  Future<List<ContactModal>> getAllcontacts() async {
    await init();
    query = "SELECT * FROM $tableName";
    List allCantacts = await database.rawQuery(query);

    List<ContactModal> allcontact =
        allCantacts.map((e) => ContactModal.fromMap(data: e)).toList();
    return allcontact;
  }

  Future<int> deletcontact({required int id}) async {
    query = "DELETE FROM $tableName WHERE $Id=$id";
    return await database.rawDelete(query);
  }
}
