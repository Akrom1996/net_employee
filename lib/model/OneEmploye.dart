// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
  Request({
    this.name,
    this.salary,
    this.age,
  });

  final String? name;
  final String? salary;
  final String? age;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    name: json["name"],
    salary: json["salary"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "salary": salary,
    "age": age,
  };
}
