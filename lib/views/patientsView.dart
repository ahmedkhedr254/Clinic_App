import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/models/examination.dart';
import 'package:hotel_app/presenter/examinationPresenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loading.dart';

class patientView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return patientViewState();
  }
}

class patientViewState extends State<patientView> {
  final searchController = TextEditingController();


  int selectedRadio = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  List<examination> PatientList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f2f5),
      appBar: PreferredSize(

          preferredSize: Size.fromHeight(100), // here the desired height
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xff4638d4),
            title: Text("my patient info",style: TextStyle(fontSize: 28,color: Colors.white),),
          )
      ),
      body: LayoutBuilder(
        builder: (context, conistrains) {
          double width = conistrains.maxWidth;
          double height = conistrains.maxHeight;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 5 / 100),
                Row(
                  children: [
                    SizedBox(
                        width: width * 80 / 100,
                        child: TextFormField(
                          controller: this.searchController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        )),
                    SizedBox(
                      height: height*10/100,
                      width: width*18/100,
                      child: FlatButton.icon(
                       onPressed: ()async{
                         SharedPreferences pref = await SharedPreferences.getInstance();
                         String apiToken = pref.getString('token');

                         if(selectedRadio==1){
                           loading().startloading(context);
                               this.PatientList=await examinationPresenter().getExaminationsWitPatientName(apiToken, this.searchController.value.text);
                              setState(() {

                              });
                           Navigator.pop(context);
                         }
                         else if(selectedRadio==2){
                           loading().startloading(context);
                           this.PatientList=await examinationPresenter().getExaminationsWitPatientmobile(apiToken, this.searchController.value.text);
                           Navigator.pop(context);
                           setState(() {

                          });
                         }
                       },
                        icon: Icon(Icons.search,color: Colors.white,),
                        label: Text(''),
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 1 / 100,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        activeColor: Colors.green,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                      ),
                    ),
                    Text("by name"),
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        activeColor: Colors.blue,
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                      ),
                    ),
                    Text("by mobile"),
                  ],
                ),
                SizedBox(
                  height: height * 2 / 100,
                ),
                Column(
                  children: PatientList.map((e) {
                    String name=e.name;
                    String mobile=e.mobile;
                    String diabetes=e.diabetes_exist;
                    String Pressure=e.Pressure_exist;
                    String sex=e.sex;
                    int fee=e.income;
                    String symptoms=e.symptoms;
                    String medicine=e.medicine;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: height * 4 / 100),
                      padding: EdgeInsets.all( height * 4 / 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("name: $name",style: TextStyle(fontSize: 20),),
                          Text("mobile: $mobile",style: TextStyle(fontSize: 20)),
                          Text("diabetes: $diabetes",style: TextStyle(fontSize: 20)),
                          Text("Pressure: $Pressure",style: TextStyle(fontSize: 20)),
                          Text("sex: $sex",style: TextStyle(fontSize: 20)),
                          Text("fee: $fee",style: TextStyle(fontSize: 20)),
                          Text("symptoms: $symptoms",style: TextStyle(fontSize: 20)),
                          Text("medicine: $medicine",style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      width: width * 90 / 100,
                      // height: height * 10 / 100,

                    );
                  }).toList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
