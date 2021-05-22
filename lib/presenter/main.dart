import 'package:Aevius/presenter/common/ui/logo_widget.dart';
import 'package:Aevius/presenter/pages/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/dI_Injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await DiInjector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Фумшгі',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          //   case MainNavigatorRoutes.camera:
        }
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                      style: TextStyle(
                          fontSize: 18,
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
