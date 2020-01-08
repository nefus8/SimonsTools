import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EasyDialog {
  static void showInfoDialog({@required BuildContext context, @required String title, @required String content}){
    // flutter defined function
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return CupertinoAlertDialog(
            title: Center(child: new Text(title)),
            content: new Text(content),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('OK', textAlign: TextAlign.justify,),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Center(child: new Text(title, style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold),)),
            content: new Text(content, textAlign: TextAlign.justify,),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text('OK',
                  style: TextStyle(fontSize: 20, color: Colors.white),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}