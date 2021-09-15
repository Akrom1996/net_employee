import 'package:flutter/material.dart';
import 'package:net_employee/services/network.dart';
import 'package:net_employee/model/OneEmploye.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  var sentData;
  uploadData() async {
    print("upload");
    var res;
    sentData = Request(
      name: textEditingController2.text,
      salary: textEditingController3.text,
      age: textEditingController4.text,
    );
    res = await Network.POSTREQUEST(requestToJson(sentData));
    if (res.status == "success") {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create new Employee"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            TextInput(controller: textEditingController1, hint: "id"),
            TextInput(controller: textEditingController2, hint: "Username"),
            TextInput(controller: textEditingController3, hint: "Salary"),
            TextInput(controller: textEditingController4, hint: "Age"),
            Container(
              width: double.infinity,
              height: 56,
              margin: EdgeInsets.only(right: 16, left: 16, top: 24),
              child: ElevatedButton(
                onPressed: () {
                  print("tap");
                  uploadData();
                },
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final controller;
  final hint;
  const TextInput({Key? key, this.controller, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
