import 'package:flutter/material.dart';

class loading{
  startloading(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child:  Container(
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                 CircularProgressIndicator(),
                 Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
  }

}
