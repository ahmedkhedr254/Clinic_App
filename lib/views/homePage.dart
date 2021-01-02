import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_app/models/currentExamination.dart';
import 'package:hotel_app/presenter/api.dart';
import 'package:hotel_app/presenter/examinationPresenter.dart';
import 'package:hotel_app/views/loading.dart';
import 'package:hotel_app/views/patientsView.dart';
import 'package:hotel_app/views/signIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'createNewPatient.dart';

class homePage extends StatefulWidget {
  String todayIncomel;
  String monthIncomel;
  String token;
  homePage(String token, String monthIncomel,String todayIncomel) {
    this.token=token;
    this.monthIncomel=monthIncomel;
    this.todayIncomel=todayIncomel;
  }
  @override
  State<StatefulWidget> createState() {
    return homePageState(this.token,this.monthIncomel,this.todayIncomel);
  }
}

class homePageState extends State<homePage> {
  String todayIncomel;
  String monthIncomel;
  String token;
  homePageState(String token , String monthIncomel,String todayIncomel) {
    this.token=token;
    this.monthIncomel=monthIncomel;
    this.todayIncomel=todayIncomel;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: LayoutBuilder(
        builder: (context, constrains) {
          double width = constrains.maxWidth;
          double height = constrains.maxHeight;
          return Stack(
            children: [
              Container(
                width: width,
                height: height * 25 / 100,
                decoration: BoxDecoration(
                  color: Color(0xff4638d4),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 8 / 100,
                    ),
                    Text(
                      "Clinic home page",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 8 / 100,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 5 / 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                      ),
                      width: width * 80 / 100,
                      height: height * 20 / 100,
                      child: Column(
                        children: [
                          Text("Incomes\$",
                              style: TextStyle(
                                  color: Color(0xff4638d4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 7 / 100)),
                          SizedBox(
                            height: height * 3 / 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: width * 5 / 100,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "This Month",
                                style: TextStyle(
                                    fontSize: width * 5 / 100,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 2 / 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                this.todayIncomel,
                                style: TextStyle(
                                    fontSize: width * 5 / 100,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                this.monthIncomel,
                                style: TextStyle(
                                    fontSize: width * 5 / 100,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 10 / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Color(0xff4638d4),
                              ),
                              width: width * 40 / 100,
                              height: width * 40 / 100,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: width * 15 / 100,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "current patient",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 4 / 100,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                          onPressed: ()async{
                            loading().startloading(context);
                              SharedPreferences pref = await SharedPreferences.getInstance();
                              String apiToken = pref.getString('token');
                              currentExamination currentEx=await examinationPresenter().getCurrentExamination(apiToken);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CreateNewPatient(currentEx)));

                          },
                        ),
                        FlatButton(
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Color(0xff4638d4),
                              ),
                              width: width * 40 / 100,
                              height: width * 40 / 100,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: width * 15 / 100,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "examinations history",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 4 / 100,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => patientView()));

                          },
                        )
                      ],
                    ),
                    FlatButton(
                      child: Text("log out"),
                      onPressed: () {
                        api().logout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                               builder: (BuildContext context) {return signIn();}));

                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
