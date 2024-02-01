import 'dart:developer';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();

  late Database database;
  String query = "";

  String contactTable = "Contacts";
  String id = "id";
  String name = "name";
  String number = "number";

  Logger logger = Logger();

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = "MyDatabase1.db";
    String path = join(dbPath + dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, ver) {
        query =
            "CREATE TABLE IF NOT EXISTS $contactTable($id INTEGER PRIMARY KEY AUTOINCREMENT,$name TEXT,$number INTEGER)";

        db
            .execute(query)
            .then((value) => logger.i("$contactTable created...."))
            .onError((error, stackTrace) => logger.e("ERROR: $error"));
      },
    );
  }

  Future<void> update({required ContactModal contact}) async {
    await database
        .update(contactTable, contact.toMap)
        .then((value) => log("Updated...."))
        .onError((error, stackTrace) => log("ERROR: $error"));
  }

  Future<void> insert({required ContactModal contact}) async {
    Map<String, dynamic> data = contact.toMap;
    data.remove('id');
    await database
        .insert(contactTable, data)
        .then((value) => log("Inserted...."))
        .onError((error, stackTrace) => log("ERROR: $error"));
  }

  Future<void> delete({required ContactModal contact}) async {
    await database
        .delete(contactTable, where: "id = ${contact.id}")
        .then((value) => log("Updated...."))
        .onError((error, stackTrace) => log("ERROR: $error"));
  }

  Future<List<ContactModal>> getData() async {
    query = "SELECT * FROM $contactTable";

    List<Map> allData = await database.rawQuery(query);

    return allData
        .map(
          (e) => ContactModal.fromMap(data: e),
        )
        .toList();
  }
}
