import 'package:employee/view/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'employee_provider/emp_provider.dart';
EmployeeViewModel empViewModel =EmployeeViewModel();
int download=0;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await empViewModel.fetchEmployees();
  download=1;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Directory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => EmployeeViewModel(),
        child: const EmployeeListScreen(),
      ),
    );
  }
}
