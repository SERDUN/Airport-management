import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withAlpha(30),
              blurRadius: 10,
              spreadRadius: 0.9,
              offset: Offset(
                0,
                2,
              )
            )
          ],
          borderRadius: new BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                width: 168,
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
