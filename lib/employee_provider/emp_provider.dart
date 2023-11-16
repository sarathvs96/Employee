import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Employee.dart';
import '../database/database.dart';

class EmployeeViewModel extends ChangeNotifier {
  List<Employee> _employees = [];
  DBEmployeeManager dbEmoployeeManager = DBEmployeeManager();

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    final response = await Dio()
        .get('https://64bfc2a60d8e251fd111630f.mockapi.io/api/Employee');
    final List<Employee> fetchedEmployees =
        (response.data as List).map((e) => Employee.fromJson(e)).toList();
    _employees = fetchedEmployees;
    notifyListeners();
    await dbEmoployeeManager.storeDataInDatabase(fetchedEmployees);
  }

  Future<void> searchEmployees(String txt) async {
    final Database database = await openDatabase('employee.db');

    final List<Map<String, dynamic>> results;
    if (txt.isNotEmpty) {
      results = await database.query(
        'Employees',
        where: 'name LIKE ? OR email LIKE ?',
        whereArgs: ['%$txt%', '%$txt%'],
      );
    } else {
      results = await database.query('Employees');
    }

    _employees = results.map((map) => Employee.fromJson(map)).toList();
    notifyListeners();
  }
}
