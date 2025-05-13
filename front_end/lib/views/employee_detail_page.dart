import 'package:flutter/material.dart';
import 'package:front_end/models/employee_model.dart';
import 'package:front_end/view_models/employee_view_model.dart';
import 'package:provider/provider.dart';

class EmployeeDetailPage extends StatefulWidget {
  final EmployeeModel employee;
  const EmployeeDetailPage({super.key, required this.employee});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){context.read<EmployeeViewModel>().onDeleteEmployee(widget.employee.employeeId);}, icon: Icon(Icons.delete)),
        ],
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              enabled: false,
              initialValue: widget.employee.name,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
            TextFormField(
              controller: _addressController,
              enabled: false,
              initialValue: widget.employee.address,
              decoration: InputDecoration(
                hintText: 'Address'
              ),
            ),
            TextFormField(
              controller: _departmentController,
              enabled: false,
              initialValue: widget.employee.department,
              decoration: InputDecoration(
                hintText: 'Department'
              ),
            ),
            TextFormField(
              controller: _emailController,
              enabled: false,
              initialValue: widget.employee.email,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            ElevatedButton(
              onPressed: (){
                context.read<EmployeeViewModel>().onSaveEditEmployee(EmployeeModel(employeeId: _employeeIdController.text, name: _nameController.text, address: _addressController.text, department: _departmentController.text, email: _emailController.text));
              },
              child: Text('Save')
            )
          ],
        ),
      ),
    );
  }
}