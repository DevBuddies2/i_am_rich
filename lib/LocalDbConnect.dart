import 'dart:io';

import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookMarkMt {
  final int id;
  final String title;
  final String url;
  final String subject;
  final String type;
  final String sem;
  final String branch;

  BookMarkMt({
    this.id,
    this.title,
    this.url,
    this.subject,
    this.type,
    this.sem,
    this.branch,
  });
}

class LocalDbConnect {
  static const kDbFileName = 'bookmarkmt_sqflite_ex.db';
  static const kDbTableName = 'bookmarkmt_tbl';
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  Database _db;

  // Opens a db local file. Creates the db table if it's not yet created.
  Future<void> initDb() async {
    final dbFolder = await getDatabasesPath();
    if (!await Directory(dbFolder).exists()) {
      await Directory(dbFolder).create(recursive: true);
    }
    final dbPath = join(dbFolder, kDbFileName);
    this._db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            '''CREATE TABLE $kDbTableName (id INTEGER PRIMARY KEY, title TEXT,url TEXT,subject TEXT,type TEXT,sem TEXT,branch TEXT)''');
      },
    );
  }

    Future<bool> asyncInit() async {
    // Avoid this function to be called multiple times,
    // cf. https://medium.com/saugo360/flutter-my-futurebuilder-keeps-firing-6e774830bc2
    await _memoizer.runOnce(() async {
      await initDb();
    });
    return true;
  }

  // Retrieves rows from the db table.
  Future getBookMarkMt() async {
    final List<Map<String, dynamic>> jsons =
        await this._db.rawQuery('SELECT * FROM $kDbTableName');
    print('${jsons.length} rows retrieved from db!');
    print(jsons);
    return jsons;
  }

  // Inserts records to the db table.
  // Note we don't need to explicitly set the primary key (id), it'll auto
  // increment.
  Future<void> addBookMarkMt(BookMarkMt bookMarkmt) async {
    await this._db.transaction(
      (Transaction txn) async {
        final int id = await txn.rawInsert(
            '''INSERT INTO $kDbTableName(title,url,subject,type,sem,branch) VALUES("${bookMarkmt.title}","${bookMarkmt.url}","${bookMarkmt.subject}","${bookMarkmt.type}","${bookMarkmt.sem}","${bookMarkmt.branch}")''');
        print('Inserted todo item with id=$id.');
      },
    );
  }

  // Deletes records in the db table.
  Future<void> deleteMt(int id) async {
    final count = await this._db.rawDelete('''
        DELETE FROM $kDbTableName
        WHERE id = $id
      ''');
    print('Updated $count records in db.');
  }


}
