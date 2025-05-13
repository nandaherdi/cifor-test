import 'package:flutter/material.dart';
import 'package:front_end/models/employee_model.dart';
import 'package:front_end/services/employee_service.dart';

class EmployeeViewModel with ChangeNotifier {
  List<EmployeeModel>? _employees;

  List<EmployeeModel>? get employees => _employees;

  set employees(List<EmployeeModel>? newValue) {
    _employees = newValue;
    notifyListeners();
  }

  Future<void> onInit() async{
    employees = null;
    List<EmployeeModel> result = await EmployeeService.getEmployees();
    employees = result;
  }

  Future<void> onSaveEditEmployee(EmployeeModel newData) async {
    await EmployeeService.updateEmployee(newData);
  }

  Future<void> onDeleteEmployee(String employeeId) async {
    await EmployeeService.deleteEmployee(employeeId);
  }
}