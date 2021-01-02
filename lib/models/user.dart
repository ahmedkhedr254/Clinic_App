import 'dart:core';
class user{
  String name;
  String username;
  String password;
  user(String name,String username,String password){
    this.name=name;
    this.username=username;
    this.password=password;
  }
  factory user.fromJson(Map<String, dynamic> parsedJson){
     return user(parsedJson['name'],parsedJson['username'],parsedJson['password']);
  }
}