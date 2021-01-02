import 'dart:core';
class examination{
  String name;
  String mobile;
  int user_id;
  int patients_id;
  String diabetes_exist;
  String Pressure_exist;
  String sex;
  int income;
  String symptoms;
  String medicine;
  examination(this.name, this.mobile,this.user_id,this.patients_id,this.diabetes_exist,this.Pressure_exist,this.sex,this.income,this.symptoms,this.medicine);
  factory examination.fromJson(Map<String, dynamic> parsedJson){
    return examination(parsedJson['name'],parsedJson['mobile'],parsedJson['user_id'],int.parse(parsedJson['patients_id']),parsedJson['diabetes_exist'],parsedJson['Pressure_exist'],parsedJson['sex'],parsedJson['income'],parsedJson['symptoms'],parsedJson['medicine']);
  }
}


