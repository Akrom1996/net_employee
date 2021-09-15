import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:net_employee/model/Employee.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static String api = "/api/v1";
  static Map<String, String> headers = {"Content-type": "Application/json; charset=UTF-8"};

  static Future GETREQUEST() async {
    Uri uri = Uri.http(BASE, api+"/employees");
    print(uri);
    var response =
        await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      print("body ${response.body}");

      return Employee.fromJson(jsonDecode(response.body));
    }
    return null;
  }
  static Future POSTREQUEST(String request)async{
    Uri uri = Uri.http(BASE, api+"/create");
    print(uri);
    print(request);
    var response = await http.post(uri,body: request);
    print(response.body);
    if(response.statusCode==200){
      return Response.fromJson(jsonDecode(response.body));
    }
    else return Future.error("error");
  }
  static Future DELETEREQUEST(int id)async{
    Uri uri = Uri.http(BASE, api+"/delete/$id");
    var response = await http.delete(uri);
    print(response.body);
    if(response.statusCode==200){
      return ResponseDelete.fromJson(jsonDecode(response.body));
    }
    else return Future.error("error");
  }
}
