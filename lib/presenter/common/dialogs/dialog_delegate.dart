import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dialog_message.dart';


class DialogDelegate {
  String _title;
  String _description;
  String _action1Title;
  String _action2Title;
  String _action3Title;
  String _action4Title;
  BuildContext context;

  VoidCallback _action1;
  VoidCallback _action2;
  VoidCallback _action3;
  VoidCallback _action4;

  Widget root;

  bool _isDialogShowing = false;

  DialogDelegate({this.context});

  static DialogDelegate withContext(BuildContext context) {
    return DialogDelegate(context: context);
  }

  DialogDelegate of(BuildContext context) {
    this.context = context;
    return this;
  }

  DialogDelegate initTitle(String title) {
    this._title = title;
    return this;
  }

  DialogDelegate initAction1(VoidCallback callback) {
    this._action1 = callback;
    return this;
  }

  DialogDelegate initAction2(VoidCallback callback) {
    this._action2 = callback;
    return this;
  }

  DialogDelegate initAction3(VoidCallback callback) {
    this._action3 = callback;
    return this;
  }

  DialogDelegate initAction4(VoidCallback callback) {
    this._action4 = callback;
    return this;
  }

  DialogDelegate initActionTitle1(String title) {
    this._action1Title = title;
    return this;
  }

  DialogDelegate initActionTitle2(String title) {
    this._action2Title = title;
    return this;
  }

  DialogDelegate initActionTitle3(String title) {
    this._action3Title = title;
    return this;
  }

  DialogDelegate initActionTitle4(String title) {
    this._action4Title = title;
    return this;
  }

  DialogDelegate initDescription(String title) {
    this._description = title;
    return this;
  }


  void showInfoDialog() {
    var root = MessageDialog(
      title: _title,
      description: _description,
      onFirsButton: () {
        _isDialogShowing = false;
        if (_action1 != null) {
          _action1();
        }
      },
      onSecondButton: () {
        _isDialogShowing = false;
      },
    );
    this.root = root;
    if (!_isDialogShowing) {
      _isDialogShowing = true;
      _buildDialog(root);
    }
  }

  void _buildDialog(Widget root) {
    showDialog(context: context, builder: (context) => root);
  }

  void showInfoSnakeBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xDE000000),
        duration: Duration(seconds: 2),
        content: Container(
          child: Text(
            _title,
            style: TextStyle(color: Colors.white),
          ),
        )));
  }
}
