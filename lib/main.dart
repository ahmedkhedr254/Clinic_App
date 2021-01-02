import 'package:flutter/material.dart';
import 'package:hotel_app/presenter/examinationPresenter.dart';
import 'package:hotel_app/views/loading.dart';
import 'package:hotel_app/views/patientsView.dart';
import 'package:hotel_app/views/signIn.dart';
import 'package:hotel_app/views/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/createNewPatient.dart';
import 'views/homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String apiToken = pref.getString('token');
  String todayIncome=await examinationPresenter().getTodayIncome(apiToken);
  String monthIncome=await examinationPresenter().getMonthIncome(apiToken);
  runApp(app(apiToken,monthIncome,todayIncome));
}
class app extends StatefulWidget{
  String token;
  String todayIncome;
  String monthIncome;
  app(String token,String monthIncome,String todayIncome){
    this.token=token;
    this.todayIncome=todayIncome;
    this.monthIncome=monthIncome;
  }
  @override
  State<StatefulWidget> createState() {
  return appState(this.token,this.monthIncome,this.todayIncome);
  }

}
class appState extends State<app>{
  String token;
  String todayIncome;
  String monthIncome;
  appState(String token,String monthIncome,String todayIncome){
    this.token=token;
    this.todayIncome=todayIncome;
    this.monthIncome=monthIncome;
  }
  @override
  Widget build(BuildContext context) {
    if (this.token==null){
      return MaterialApp(
        home: signIn(),
      );
    }
    else{
      return MaterialApp(
        home: homePage(this.token,this.monthIncome,this.todayIncome),
      );
    }

  }


}
