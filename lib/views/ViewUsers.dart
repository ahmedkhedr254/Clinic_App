import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class ViewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ViewPageState();
  }


}
class ViewPageState extends State<ViewPage>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: LayoutBuilder(builder: (context,conistrains){
         
       },),
     );
  }
}