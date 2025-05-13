import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

class EmployeeModel {
  late String employeeId;
  late String name;
  late String address;
  late String department;
  late String email;

  EmployeeModel({
    required this.employeeId,
    required this.name,
    required this.address,
    required this.department,
    required this.email,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    name = json['name'];
    address = json['address'];
    department = json['department'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['department'] = this.department;
    data['address'] = this.address;
    return data;
  }
}
