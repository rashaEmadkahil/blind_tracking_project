import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbController {
  static final DbController _instance = DbController._();
  late Database _database;

  factory DbController() {
    return _instance;
  }
  Database get database =>_database;
  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        db.execute('CREATE TABLE fags('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'question VARCHAR(45),'
            'answer VARCHAR(45),'
            'active TINYINT'
            ')');

        db.execute('CREATE TABLE admins('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'name VARCHAR(45),'
            'email VARCHAR(45),'
            'mobile VARCHAR(45),'
            'gender ENUM,'
            'active TINYINT,'
            'password VARCHAR(45)'
            ')');

        db.execute('CREATE TABLE contact_requests('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'title VARCHAR(45),'
            'message VARCHAR(45),'
            'sponsors_id VARCHAR(45),'
            'FORIGN KEY (sponsors_id) REFERENCES sponsors (id) ON DELETE CASCADE ON UPDATE CASCADE'
            ')');

        db.execute('CREATE TABLE sponsors('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'first_name VARCHAR(45),'
            'last_name VARCHAR(45),'
            'email VARCHAR(45),'
            'mobile VARCHAR(45),'
            'gender ENUM,'
            'password VARCHAR(45),'
            'active TINYINT,'
            'cities_id INTEGER,'
            'FORIGN KEY (cities_id) REFERENCES cities (id) ON DELETE CASCADE ON UPDATE CASCADE'
            ')');

        db.execute('CREATE TABLE cities('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'name VARCHAR(45)'
            ')');

        db.execute('CREATE TABLE users('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'last_name VARCHAR(45),'
            'email VARCHAR(45),'
            'mobile VARCHAR(45),'
            'gender ENUM,'
            'password VARCHAR(45),'
            'active TINYINT,'
            'cities_id INTEGER,'
            'sponsors_id VARCHAR(45),'
            'first_emergancy_num VARCHAR(45),'
            'second_emergancy_num VARCHAR(45),'
            'image VARCHAR(45),'
            'status ENUM(45),'
            'FORIGN KEY (cities_id) REFERENCES cities (id) ON DELETE CASCADE ON UPDATE CASCADE,'
            'FORIGN KEY (sponsors_id) REFERENCES sponsors (id) ON DELETE CASCADE ON UPDATE CASCADE'
            ')');

        db.execute('CREATE TABLE call_logs('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'datetime DATETIME,'
            ' users_id INTEGER,'
            'status ENUM(45),'
            'password TEXT,'
            'user_id INTEGER,'
            'FORIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE'
            ')');

        db.execute('CREATE TABLE notifications('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'title VARCHAR(45),'
            'body VARCHAR(45),'
            'payload_data VARCHAR(45),'
            'object_id INTEGER,'
            'object_type VARCHAR(100)'
            ')');


        db.execute('CREATE TABLE trips('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'start_datetime DATETIME,'
            'end_datetime DATETIME,'
            'from_latlng VARCHAR(45),'
            'distance VARCHAR(45),'
            'status ENUM(45),'
            'user_id INTEGER,'
            'FORIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE'
            ')');

        db.execute('CREATE TABLE categories('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'name VARCHAR(45),'
            'active TINYINT,'
            ')');


        db.execute('CREATE TABLE locations('
            'id INTEGER PRIMARY KEYAUTOINCREMENT,'
            'name VARCHAR(45),'
            'info VARCHAR(45),'
            'latlang VARCHAR(45),'
            'active TINYINT,'
            'categories_id INTEGER,'
            'FORIGN KEY (categories_id) REFERENCES categories (id) ON DELETE CASCADE ON UPDATE CASCADE'
            ')');


      },
      onUpgrade: (Database db, int oldversion, int newversion) {},
      onDowngrade: (Database db, int oldversion, int newversion) {},
    );
  }

  DbController._();
}
