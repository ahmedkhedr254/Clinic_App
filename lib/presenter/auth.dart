import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class auth{

  Register(String tocken,String name,String username,String password)async{
    String url = 'https://clinicapp97854.000webhostapp.com/public/api/register';
    print(username);
    // make POST request
    var response = await post(url,
        body: {'name':name,'username':username,'password':password}
    );
    if(response.statusCode == 200){
      var body =response.body;
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', json.decode(body)['token']);
      return json.decode(body);

    }

  }
  signIn(String username,String password)async{
    String url = 'https://clinicapp97854.000webhostapp.com/public/api/login';
    // make POST request
    var response = await post(url,
        body: {'username':username,'password':password}
    );
    if(response.statusCode == 200){
      var body =response.body;
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', json.decode(body)['token']);
      return json.decode(body);

    }
  }
  logout() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}