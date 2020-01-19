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

  static void showDialogWithOptions({
    @required BuildContext context,
    @required String title,
    @required String content,
    @required String textButton1,
    String textButton2 = 'Annuler',
    @required Function onPressedButton1,
    Function onPressedButton2,
    bool isButton2ACancelButton = true,
    }){
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
                child: Text(textButton1, textAlign: TextAlign.justify,),
                onPressed: onPressedButton1,
              ),
              CupertinoDialogAction(
                child: Text(textButton2, textAlign: TextAlign.justify,),
                onPressed: onPressedButton2 != null ? onPressedButton2 : () => Navigator.of(context).pop(),
                isDestructiveAction: isButton2ACancelButton,
                isDefaultAction: true,
              ),
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
                child: new Text(textButton1,
                  style: TextStyle(fontSize: 20, color: Colors.white),),
                onPressed: onPressedButton1,
              ),
              new FlatButton(
                child: new Text(textButton2,
                  style: TextStyle(fontSize: 20, color: isButton2ACancelButton ? Colors.redAccent : Colors.white),),
                onPressed: onPressedButton2 != null ? onPressedButton2 : () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }
}