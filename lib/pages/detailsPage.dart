import 'package:flutter/material.dart';
import 'package:net_employee/services/network.dart';

class DetailsPage extends StatefulWidget {
  final employee;
  const DetailsPage({Key? key, required this.employee}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _employee;
  removeEmployee(id) async {
    print(id);
    await Network.DELETEREQUEST(id)
        .then((value) => {
              Navigator.pop(context),
            })
        .catchError((onError) => {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("$onError"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"),
                    ),
                  ],
                ),
              ),
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _employee = widget.employee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_employee!.employeeName}"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "${_employee!.employeeName}(${_employee!.employeeAge})",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Salary: ${_employee!.employeeSalary}",
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                removeEmployee(_employee.id);
              },
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
