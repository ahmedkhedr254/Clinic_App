import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_app/models/currentExamination.dart';
import 'package:hotel_app/presenter/examinationPresenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateNewPatient extends StatefulWidget {
  currentExamination current;
  CreateNewPatient(this.current);
  @override
  State<StatefulWidget> createState() {
    return CreateNewPatientState(current);
  }
}

class CreateNewPatientState extends State<CreateNewPatient> {

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final feeController = TextEditingController();
  final medecinController = TextEditingController();
  final symptomsController = TextEditingController();
  String sexValue ;
  String diabetesValue ;
  String pressureValue ;
  currentExamination current;
  CreateNewPatientState(currentExamination current){
    this.current=current;
    nameController.text=current.name;
    mobileController.text=current.mobile;
    if (current.income==null){
      feeController.text=null;
    }
    else{
      feeController.text=current.income.toString();
    }
    medecinController.text=current.medicine;
    symptomsController.text=current.symptoms;
     sexValue = current.sex;
    diabetesValue = current.diabetes_exist;
    pressureValue = current.Pressure_exist;
  }

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "create new patient",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Color(0xff4638d4),
        ),
        body: LayoutBuilder(
          builder: (context, constrains) {
            double width = constrains.maxWidth;
            double height = constrains.maxHeight;
            return SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.all(width * 5 / 100),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextFormField(

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "name",
                            filled: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                          ),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "diabetes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 4 / 100,
                                      color: Colors.black),
                                ),
                                DropdownButton<String>(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 4 / 100,
                                      color: Colors.black),
                                  value: diabetesValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      diabetesValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'yes',
                                    'no'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "pressure",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 4 / 100,
                                      color: Colors.black),
                                ),
                                DropdownButton<String>(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 4 / 100,
                                      color: Colors.black),
                                  value: pressureValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      pressureValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'yes',
                                    'no'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "sex",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 4 / 100,
                                      color: Colors.black),
                                ),
                                DropdownButton<String>(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 4 / 100,
                                      color: Colors.black),
                                  value: sexValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      sexValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'male',
                                    'female'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height * 2 / 100),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: width * 30 / 100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(
                                      width: width * 30 / 100,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        controller: feeController,

                                        decoration: InputDecoration(
                                          hintText: "fee",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.teal)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    width: width * 30 / 100,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: mobileController,
                                      decoration: InputDecoration(
                                        hintText: "mobile",
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 3 / 100,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: symptomsController,
                          decoration: InputDecoration(
                            hintText: "symptoms",
                            filled: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                          ),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: medecinController,
                          decoration: InputDecoration(
                            hintText: "medicine",
                            filled: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                          ),
                        ),
                        SizedBox(
                          height: height * 3 / 100,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: width*5/100),
                                child: FlatButton(
                                onPressed: () async {
                        if (_formKey.currentState.validate()) {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                        String apiToken = pref.getString('token');
                        var x=await examinationPresenter().saveCurrentExamination(apiToken, nameController.value.text, mobileController.value.text, diabetesValue, pressureValue, sexValue,medecinController.value.text,symptomsController.value.text,feeController.value.text);


                        }



                        },
                          color: Colors.blue,
                          child: Text(
                            "nurse Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                              )
                              ,FlatButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    String apiToken = pref.getString('token');
                                    var x=await examinationPresenter().createNewExamination(apiToken, nameController.value.text, mobileController.value.text, diabetesValue, pressureValue, sexValue,medecinController.value.text,symptomsController.value.text, feeController.value.text,);
                                    print(x);
                                  }



                                },
                                color: Colors.blue,
                                child: Text(
                                  "submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
