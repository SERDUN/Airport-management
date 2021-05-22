import 'package:Aevius/presenter/common/ui/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: LogoWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Weather for you",
                          style: TextStyle(fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'GochiHands'),
                        ),
                        margin: EdgeInsets.only(bottom: 8),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
