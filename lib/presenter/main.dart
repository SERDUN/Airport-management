import 'package:Aevius/presenter/common/ui/logo_widget.dart';
import 'package:Aevius/presenter/pages/main_routes.dart';
import 'package:Aevius/presenter/pages/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     default:  GetIt.I.get<BlocProvider<SplashBloc>>()l
      //   }
      // },
      home: GetIt.I.get<BlocProvider<SplashBloc>>(),
    );
  }
}
