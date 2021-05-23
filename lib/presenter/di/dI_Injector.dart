import 'package:Aevius/config/env.dart';
import 'package:Aevius/data/repository/base_repository.dart';
import 'package:Aevius/data/repository/location_repository.dart';
import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/presenter/pages/root/flights/bloc/airports_bloc.dart';
import 'package:Aevius/presenter/pages/root/flights/airports_page.dart';
import 'package:Aevius/presenter/pages/splash/bloc/splash_bloc.dart';
import 'package:Aevius/presenter/pages/splash/splash_page.dart';
import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:Aevius/presenter/pages/weather/weather_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiInjector {
  static Future init() async {
    await initRepository();
    await injectPages();

    return Future.value();
  }

  static Future initRepository() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    //register data source
    GetIt.I.registerSingleton<SharedPreferences>(sharedPreferences);
    //GetIt.I.registerSingleton<RestClient>(dioRestClient);

    GetIt.I.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl());
    GetIt.I.registerLazySingleton<BaseRepository>(
        () => BaseRepositoryImpl(aviationKey, weatherKey));

    return Future.value();
  }

  static Future injectPages() {
    GetIt.I.registerFactory<BlocProvider<SplashBloc>>(() => BlocProvider(
          create: (BuildContext context) =>
              SplashBloc(GetIt.I.get<LocationRepository>()),
          child: SplashPage(),
        ));

    GetIt.I.registerFactory<BlocProvider<WeatherBloc>>(() => BlocProvider(
          create: (BuildContext context) => WeatherBloc(),
          child: WeatherPage(),
        ));

    GetIt.I.registerFactory<BlocProvider<AirportsBloc>>(() => BlocProvider(
          create: (BuildContext context) => AirportsBloc(
            GetIt.I.get<BaseRepository>(),
            GetIt.I.get<LocationRepository>(),
          ),
          child: AirportsPage(),
        ));

    return Future.value();
  }
}
