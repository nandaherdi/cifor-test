import 'package:flutter/material.dart';
import 'package:front_end/view_models/employee_view_model.dart';
import 'package:front_end/views/employee_detail_page.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    Future.microtask(()=> context.read<EmployeeViewModel>().onInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<EmployeeViewModel>(
          builder: (_, employeesData, _) {
            if (employeesData.employees == null) {
              return Center(child: CircularProgressIndicator(),);
            } else if (employeesData.employees!.isEmpty) {
              return Center(child: Text('no data found'),);
            } else {
              return ListView.builder(
                itemCount: employeesData.employees!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(employeesData.employees![index].name),
                    subtitle: Text(employeesData.employees![index].email),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmployeeDetailPage(employee: employeesData.employees![index],)),
                      );
                    },
                  );
                }
              );
            }
          }
        )
      ),
    );
  }
}