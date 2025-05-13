import 'package:front_end/models/employee_model.dart';
import 'package:front_end/services/base_service.dart';

class EmployeeService extends BaseService {
  static Future<List<EmployeeModel>> getEmployees() async {
    var response = await BaseService.get(path: 'Get');
    List<EmployeeModel> getEmployeeResponse;
    try {
      getEmployeeResponse = employeeModelFromJson(response.body).toList();
    } catch (_) {
      throw "${response.statusCode}: ${response.reasonPhrase}";
    }

    return getEmployeeResponse;
  }

  static Future<List<EmployeeModel>> getEmployeesById(String id) async {
    var response = await BaseService.get(path: '/Get/$id');
    List<EmployeeModel> getEmployeeResponse;
    try {
      getEmployeeResponse = employeeModelFromJson(response.body).toList();
    } catch (_) {
      throw "${response.statusCode}: ${response.reasonPhrase}";
    }

    return getEmployeeResponse;
  }

  static Future<List<EmployeeModel>> searchEmployees(String name, String department) async {
    var response = await BaseService.get(path: '/Get/employees/search?name=$name&department=$department');
    List<EmployeeModel> getEmployeeResponse;
    try {
      getEmployeeResponse = employeeModelFromJson(response.body).toList();
    } catch (_) {
      throw "${response.statusCode}: ${response.reasonPhrase}";
    }

    return getEmployeeResponse;
  }

  static Future<List<EmployeeModel>> insertEmployee(EmployeeModel employee) async {
    var response = await BaseService.post(path: '/employees', requestData: employee);
    List<EmployeeModel> getEmployeeResponse;
    try {
      getEmployeeResponse = employeeModelFromJson(response.body).toList();
    } catch (_) {
      throw "${response.statusCode}: ${response.reasonPhrase}";
    }

    return getEmployeeResponse;
  }

  static Future<List<EmployeeModel>> updateEmployee(EmployeeModel employee) async {
    var response = await BaseService.put(path: '/employees', id: employee.employeeId, requestData: employee);
    List<EmployeeModel> getEmployeeResponse;
    try {
      getEmployeeResponse = employeeModelFromJson(response.body).toList();
    } catch (_) {
      throw "${response.statusCode}: ${response.reasonPhrase}";
    }

    return getEmployeeResponse;
  }

  static Future<List<EmployeeModel>> deleteEmployee(String id) async {
    var response = await BaseService.delete(path: '/employees', id: id);
    List<EmployeeModel> getEmployeeResponse;
    try {
      getEmployeeResponse = employeeModelFromJson(response.body).toList();
    } catch (_) {
      throw "${response.statusCode}: ${response.reasonPhrase}";
    }

    return getEmployeeResponse;
  }
}