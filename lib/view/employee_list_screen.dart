import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../employee_provider/emp_provider.dart';
import '../main.dart';
import 'employee_details_screen.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeViewModel = Provider.of<EmployeeViewModel>(context);
    if (download == 1) {
      employeeViewModel.searchEmployees("");
    }
    download = 0;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffce65af), Color(0xff263f69)],
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 36, bottom: 20),
              child: Text(
                "Employee List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                color: Colors.white.withOpacity(0.1),
                child: TextField(
                  onChanged: (val) {
                    employeeViewModel.searchEmployees(val);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search by Name or Email',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer<EmployeeViewModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    itemCount: model.employees.length,
                    itemBuilder: (context, index) {
                      final employee = model.employees[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1)),
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.grey),
                              child: employee.image!.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        employee.image!,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : const Icon(Icons.person),
                            ),
                            title: Text(employee.name!),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EmployeeDetailScreen(employee: employee),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
