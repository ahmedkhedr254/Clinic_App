import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_app/presenter/auth.dart';
import 'package:hotel_app/presenter/examinationPresenter.dart';
import 'package:hotel_app/views/signUp.dart';

import '../presenter/api.dart';
import 'homePage.dart';
import 'loading.dart';

class signIn extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return signInState();
  }
}

class signInState extends State<signIn> {

  final UserNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f2f2),
      body: Container(
        child: LayoutBuilder(
          builder: (context, constrains) {
            double width = constrains.maxWidth;
            double height = constrains.maxHeight;
            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                   Container(
                      width: width,
                      height: height * 60 / 100,
                      decoration: BoxDecoration(
                        color: Color(0xff4638d4),
                        borderRadius: BorderRadius.only(
                            // topRight: Radius.circular(90.0),
                            bottomRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0)),
                      ),
                    ),

                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: width * 5 / 100),
                        width: width * 90 / 100,
                        height: height * 90 / 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 10 / 100,
                            ),
                            Text(
                              "Clinic application",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: width * 10 / 100,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: height * 5 / 100,
                            ),
                            Text(
                              "Fill the below information to log in",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 5 / 100),
                            ),
                            SizedBox(
                              height: height * 3 / 100,
                            ),
                            Container(
                             
                              width: width * 80 / 100,
                              height: height * 50 / 100,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(40))),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 2 / 100,
                                    ),
                                    Text(
                                      "Login Account",
                                      style: TextStyle(
                                          fontSize: width * 6 / 100,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height * 5 / 100,
                                    ),
                                    Form(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: width * 70 / 100,
                                              child: TextFormField(
                                                controller: this.UserNameController,
                                                decoration: InputDecoration(
                                                    hintText: "Username or E-mail"),
                                              )),
                                          SizedBox(height: height * 3 / 100),
                                          SizedBox(
                                              width: width * 70 / 100,
                                              child: TextFormField(
                                                controller: this.passwordController,
                                                decoration:
                                                    InputDecoration(hintText: "password"),
                                              )),
                                          SizedBox(height: height * 9 / 100),
                                          FlatButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () async{
                                              loading().startloading(context);
                                                 var x=await auth().signIn( this.UserNameController.value.text.toString(), this.passwordController.value.text.toString());
                                                 String todayIncome=await examinationPresenter().getTodayIncome(x['token']);
                                                 String monthIncome=await examinationPresenter().getMonthIncome(x['token']);
                                              Navigator.pop(context);
                                              if (x['state']=='done'){
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => homePage(x['token'],monthIncome,todayIncome)));
                                              }
                                              else{
                                                showDialog(context: context,builder: (BuildContext context){
                                                  return AlertDialog(

                                                    content: Text(x['state']),
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                               , color: Color(0xff4638d4),
                                              ),
                                              width: width * 50 / 100,
                                              height: height*8/100,

                                              child: Center(
                                                  child: Text(
                                                "LOG IN",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width*5/100
                                                ),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                      ),
                      FlatButton(child: Text("Sign Up"),onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => signUp()));


                      },)
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
