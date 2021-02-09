
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';


class KPushNotice {

  static show(BuildContext context, String message, String title) {
    Color bgColor = Colors.white;
    Flushbar(
      messageText: Text(message, style: TextStyle(color: Colors.black, fontSize: 10),),
      titleText: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      duration:  Duration(seconds: 7),
      animationDuration: Duration(milliseconds: 500),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      margin: const EdgeInsets.only(left: 20, right: 20),
      backgroundColor: bgColor,
      boxShadows:  [
        BoxShadow(
            offset: Offset(1,1),
            blurRadius: 10,
            color: Colors.grey[300]
        ),
        BoxShadow(
            offset: Offset(-1,-1),
            blurRadius: 10,
            color: Colors.grey[300]
        )
      ],
      borderRadius: 10,
    )..show(context);

  }
}