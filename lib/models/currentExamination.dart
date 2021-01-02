import 'dart:core';
class currentExamination{
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
  currentExamination(this.name, this.mobile,this.user_id,this.diabetes_exist,this.Pressure_exist,this.sex,this.income,this.symptoms,this.medicine);
  factory currentExamination.fromJson(Map<String, dynamic> parsedJson){

    return currentExamination(parsedJson['name'],parsedJson['mobile'],parsedJson['user_id'],parsedJson['diabetes_exist'],parsedJson['Pressure_exist'],parsedJson['sex'],parsedJson['income'],parsedJson['symptoms'],parsedJson['medicine']);
  }
}


