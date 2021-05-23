import 'package:Aevius/presenter/common/ui/logo_widget.dart';
import 'package:Aevius/presenter/pages/main_routes.dart';
import 'package:Aevius/presenter/pages/root/airports/bloc/airports_bloc.dart';
import 'package:Aevius/presenter/pages/root/bookmarks/bloc/saved_bloc.dart';
import 'package:Aevius/presenter/pages/root/root_navigation_page.dart';
import 'package:Aevius/presenter/pages/root/settings/settings_bloc.dart';
import 'package:Aevius/presenter/pages/splash/bloc/splash_bloc.dart';
import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'argument/weather_airports_arg.dart';
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
    precacheImage(Image.asset("assets/logo.png").image, context);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MainNavigatorRoutes.home:
            //todo move injection here
            return MaterialPageRoute(
              builder: (context) => RootPage(
                airports: GetIt.I.get<BlocProvider<AirportsBloc>>(),
                bookmark: GetIt.I.get<BlocProvider<SavedBloc>>(),
                settings: GetIt.I.get<BlocProvider<SettingsBloc>>(),
              ),
            );
          case MainNavigatorRoutes.weather:
            WeatherAirportArg arg = settings.arguments;
            return MaterialPageRoute(
              builder: (context) => GetIt.I.get<BlocProvider<WeatherBloc>>(
                  param1: arg.weatherModel, param2: arg.airportModel),
            );
          case MainNavigatorRoutes.saved:
            return MaterialPageRoute(
              builder: (context) => GetIt.I.get<BlocProvider<SavedBloc>>(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => GetIt.I.get<BlocProvider<SplashBloc>>(),
            );
        }
      },
      home: GetIt.I.get<BlocProvider<SplashBloc>>(),
    );
  }
}
