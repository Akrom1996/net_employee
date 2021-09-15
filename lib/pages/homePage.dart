import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_employee/model/Employee.dart';
import 'package:net_employee/pages/addEmployee.dart';
import 'package:net_employee/pages/detailsPage.dart';
import 'package:net_employee/services/network.dart';
import 'package:net_employee/model/OneEmploye.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  var myData;

  _loadEmployees() {
    Network.GETREQUEST().then(
      (value) => setState(() {
        data = value;

      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Employees"),
      ),
      body: Container(
          child: data == null
              ? Center(
                  child: SizedBox(height: 40,width: 40,child: CircularProgressIndicator(),)
                )
              : ListView.separated(
                  itemCount: data.data.length,
                  separatorBuilder: (context, index)=>Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) =>
                                DetailsPage(employee: data.data[index]),
                          ),
                        );
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${data.data[index].employeeName}"),
                          Text("${data.data[index].employeeAge}"),
                        ],
                      ),
                      subtitle: Text("${data.data[index].employeeSalary}"),
                    );
                  })),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) =>
                AddEmployee(),
          ),
        );
      },child: Icon(Icons.add),),
    );
  }
}
