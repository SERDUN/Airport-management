import 'dart:ui';

import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String description;
  final String secondButtonTitle;
  final String firstButtonTitle;
  final Color firstButtonColor;
  final Color secondButtonColor;
  final Function onSecondButton;
  final Function onFirsButton;

  const MessageDialog({Key key,
    this.title,
    this.description,
    this.secondButtonTitle,
    this.firstButtonColor = Colors.white,
    this.secondButtonColor = Colors.white,
    this.onSecondButton,
    this.onFirsButton,
    this.firstButtonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return addNetworkDialog(context);
  }

  Widget addNetworkDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: title != null
          ? Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF303030)),
                child: Icon(
                  Icons.sms_failed_rounded,
                  color: Colors.white,
                )),
          ),
          Expanded(
            child: new Text(
              title,
              style: TextStyle(fontSize: 20.0, color: text_main),
            ),
          ),
        ],
      )
          : null,
      content: new Text(
        description,
        textAlign: TextAlign.left,
        style: TextStyle(color: text_main, fontSize: 13.0),
      ),
      actions: <Widget>[
        (secondButtonTitle != null)
            ? FlatButton(
            onPressed: () {
              onSecondButton();
              //   delete();
            },
            child: new Text(
              secondButtonTitle.toUpperCase(),
              style: TextStyle(fontSize: 14.0, color: text_main),
            ))
            : SizedBox(),
        new FlatButton(
            onPressed: () {
              if (onFirsButton != null) {
                Navigator.of(context).pop();
                onFirsButton();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: new Text(
              firstButtonTitle == null
                  ? "OK".toUpperCase()
                  : firstButtonTitle.toUpperCase(),
              style: TextStyle(fontSize: 14.0, color: text_main),
            )),
      ],
    );
  }
}
