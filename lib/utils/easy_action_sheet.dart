import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EasyActionSheet {
  static void _showActionSheet({
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

    if (!Platform.isIOS) {

      for (int i = 0; i < numberOfActions; i++) {
        _wList.add(
          CupertinoActionSheetAction(
            child: Text(actionTextList[i]),
            onPressed: actionFunctonList[i],
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
                onPressed: cancelFunction,
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
              onTap: actionFunctonList[i],
          ),
        );
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
}