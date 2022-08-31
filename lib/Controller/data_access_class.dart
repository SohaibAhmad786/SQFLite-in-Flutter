import 'dart:io';

import 'package:database_example/Model/student_model.dart';
import 'package:database_example/View/display_student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBhelper {
  ////////////////////////////////////     PRIVATE CONSTRUCTOR      //////
  ///
  DBhelper._privateConstructor();

  ////////////////////////      INSTANCE OF PRIVATE CONSTRUCTOR   //////////
  ///

  static final DBhelper instance = DBhelper._privateConstructor();

  // ignore: unused_field
  static Database? _dB;

  ////////////////////////////      CHECKING DATABASE       /////////////
  ///

  Future<Database?> get database async {
    if (_dB != null) {
      return _dB;
    } else {
      _dB = await _initDatabase();
      return _dB;
    }
  }

  ////////////////////////////    INITIALIZATION DATABASE       /////////////
  ///

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String Path = join(documentDirectory.path, "StudentDatabase");
    return await openDatabase(Path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.execute(
      '''
          CREATE TABLE student (
            id INTEGER PRIMARY KEY,
            fname TEXT NOT NULL,
            lname TEXT NOT NULL,
            city TEXT NOT NULL,
            gender TEXT NOT NULL,
            age INTEGER NOT NULL
          )
      '''

);
  }
  ///////////////////////////////     CRUD OPERATION          ////////////
  ///

  insert(std) async {
    Map<String, dynamic> data = {
      'fname': std.fname,
      'lname': std.lname,
      'city': std.city,
      'gender': std.gender,
      'age': std.age
    };
    Database? db = await instance.database;
    await db!.insert('student', data);
    print("Inserted Successfulyy");
    print(data);
  }

  read() async {
    Database? db = await instance.database;
    return await db!.query('student');
  }

  update(Student std, int age) async {
    Database? db = await instance.database;
    Map<String, dynamic> data = {
      'fname': std.fname,
      'lname': std.lname,
      'city': std.city,
      'gender': std.gender,
      'age': std.age
    };
    db!.update('student', data, where: 'age=?', whereArgs: [age]);
  }

  delete(int idd) async {
    Database? db = await instance.database;
    db!.delete('student', where: 'age=?', whereArgs: [idd]);
  }
}
