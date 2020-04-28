import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EasyActionSheet {
  static void showActionSheet({
    @required BuildContext context,
    int numberOfActions = 1,
    @required title,
    String message,
    @required List<String> actionTextList,
    @required List<Function> actionFunctonList,
    bool isThereACancelButton = false,
    String cancelText = 'Cancel',
    Function cancelFunction,
  }) {
    List<Widget> _wList = List();

    if (Platform.isIOS) {

      for (int i = 0; i < numberOfActions; i++) {
        _wList.add(
          CupertinoActionSheetAction(
            child: Text(actionTextList[i]),
            onPressed: () => _execute(actionFunctonList[i], context),
          ),
        );
      }

      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              title: Text(title),
              message: message != null ? Text(message) : null,
              actions: _wList,
              cancelButton: isThereACancelButton ? CupertinoActionSheetAction(
                child: Text(cancelText),
                onPressed: () => _execute(cancelFunction, context),
                isDestructiveAction: true,
              ) : null,
            );
          }
      );
    } else {

      _wList.add(
        new ListTile(
          title: new Text(title, textAlign: TextAlign.center,),
          subtitle: message != null ? Text(message) : null,
        ),
      );

      for (int i = 0; i < numberOfActions; i++) {
        _wList.add(
          new ListTile(
              title: new Text(actionTextList[i]),
              onTap: () => _execute(actionFunctonList[i], context),
          ),
        );
      }

      if (isThereACancelButton) {
        _wList.add(
          new ListTile(
            title: new Text(''),
          ),
        );
        _wList.add(new ListTile(
          title: new Text(cancelText, style: TextStyle(color: Colors.red),),
          onTap: () => _execute(cancelFunction, context),
        ));
      }

      _wList.add(
        new ListTile(
          title: new Text(''),
        ),
      );

      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc){
            return Container(
              child: new Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: _wList
              ),
            );
          }
      );
    }
  }

  static void _execute(Function function, BuildContext context) {
    function();
    Navigator.pop(context);
  }
}