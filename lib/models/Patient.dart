import 'dart:core';
class patient{
  String name;
  String mobile;
  patient(String name,String mobile){
    this.name=name;
    this.mobile=mobile;
  }
  factory patient.fromJson(Map<String, dynamic> parsedJson){
    return patient(parsedJson['name'],parsedJson['mobile']);
  }
}