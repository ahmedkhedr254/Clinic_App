import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_app/models/currentExamination.dart';
import 'package:hotel_app/models/examination.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class examinationPresenter {
  createNewExamination(
      String token,
      String name,
      String mobile,
      String diabetes_exist,
      String Pressure_exist,
      String sex,
      String medicine,
      String symptoms,
      String income) async {
    var header = {
      'Authorization': 'Bearer $token',
    };
    var body = {
      'name': name,
      'mobile': mobile,
      'user_id': diabetes_exist,
      'diabetes_exist': diabetes_exist,
      'Pressure_exist': Pressure_exist,
      'sex': sex,
      'income': income,
      'medicine':medicine,
      'symptoms':symptoms
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/AddExaminations';

    var response = await post(url, headers: header, body: body);
    return response.body;
  }
  saveCurrentExamination(
      String token,
      String name,
      String mobile,
      String diabetes_exist,
      String Pressure_exist,
      String sex,
      String medicine,
      String symptoms,
      String income) async {
    print(token);
    var header = {
      'Authorization': 'Bearer $token',
    };
    var body = {
      'name': name,
      'mobile': mobile,
      'diabetes_exist': diabetes_exist,
      'Pressure_exist': Pressure_exist,
      'sex': sex,
      'income': income,
      'medicine':medicine,
      'symptoms':symptoms
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/updateCurrent';

    var response = await post(url, headers: header, body: body);
    return response.body;
  }


  getAllExamination(String token) async {
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/examinations';

    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await get(url, headers: header);
    List ListOfJsons = json.decode(response.body) as List;
    List<examination> examinationObjectsList = ListOfJsons.map((e) {
      return examination.fromJson(e as Map<String, dynamic>);
    }).toList();
    return examinationObjectsList;
  }

  getExaminationsWitPatientName(String token, String name) async {
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/getAllExamsWithName/$name';
    Response response = await get(url, headers: header);
    List ListOfJsons = json.decode(response.body) as List;
    List<examination> examinationObjectsList = ListOfJsons.map((e) {
      return examination.fromJson(e as Map<String, dynamic>);
    }).toList();
    return examinationObjectsList;
  }

  getExaminationsWitPatientmobile(String token, String mobile) async {
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/getAllExamsWithMobile/$mobile';
    Response response = await get(url, headers: header);
    List ListOfJsons = json.decode(response.body) as List;
    List<examination> examinationObjectsList = ListOfJsons.map((e) {
      return examination.fromJson(e as Map<String, dynamic>);
    }).toList();
    return examinationObjectsList;
  }

  getCurrentExamination(String token) async{
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/get_current_examination';
    Response response = await get(url, headers: header);
    return currentExamination.fromJson(json.decode(response.body));
  }

  getTodayIncome(String token) async{
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/todayIncome';
    Response response = await get(url, headers: header);
    return response.body;
  }
  getMonthIncome(String token) async{
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url =
        'https://clinicapp97854.000webhostapp.com/public/api/monthIncome';
    Response response = await get(url, headers: header);
    return response.body;
  }
}
