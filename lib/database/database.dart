import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Employee.dart';

class DBEmployeeManager {
  Future<void> storeDataInDatabase(List<Employee> employees) async {
    final Database database = await openDatabase(
        join(await getDatabasesPath(), "employee.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Employees (id TEXT PRIMARY KEY, name TEXT, email TEXT,"
          " designation TEXT, department TEXT, image TEXT, createdAt TEXT)");
    });

    for (final employee in employees) {
      await database.insert(
        'Employees',
        employee.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
