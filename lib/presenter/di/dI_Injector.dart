import 'package:Aevius/config/env.dart';
import 'package:Aevius/data/repository/base_repository.dart';
import 'package:Aevius/data/repository/location_repository.dart';
import 'package:Aevius/data/source/local_storage.dart';
import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/mappers/airport_mapper.dart';
import 'package:Aevius/domain/entity/mappers/weather_mapper.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/AddAirportToBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/AddAirportToBookmarkUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/GetAirportsFromBookmarkUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/GetAirportsFromBookmarksUseCase.dart';
import 'package:Aevius/domain/usecases/GetNearbyAirportsUseCase.dart';
import 'package:Aevius/domain/usecases/GetNearbyAirportsUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/GetWeatherUseCase.dart';
import 'package:Aevius/domain/usecases/GetWeatherUseCaseImpl.dart';
import 'package:Aevius/presenter/pages/root/flights/bloc/airports_bloc.dart';
import 'package:Aevius/presenter/pages/root/flights/airports_page.dart';
import 'package:Aevius/presenter/pages/root/saved/bloc/saved_bloc.dart';
import 'package:Aevius/presenter/pages/root/saved/saved_page.dart';
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
    await initMappers();
    await initUseCase();
    await injectPages();
    return Future.value();
  }

  static Future initMappers() async {
    GetIt.I.registerFactory<Mapper<AirportDTO, AirportModel>>(
        () => AirportMapper());
    GetIt.I.registerFactory<Mapper<WeatherDto, WeatherModel>>(
        () => WeatherMapper());
    return Future.value();
  }

  static Future initRepository() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    RestClient restClientAirPorts =
        RestClient("http://aviation-edge.com/v2/public");
    RestClient restClientWeather = RestClient("https://avwx.rest/api");

    GetIt.I.registerSingleton<LocalStorage>(LocalStorage(sharedPreferences));

    GetIt.I.registerSingleton<SharedPreferences>(sharedPreferences);

    GetIt.I.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl());
    GetIt.I.registerLazySingleton<BaseRepository>(() => BaseRepositoryImpl(
        aviationKey,
        weatherKey,
        restClientAirPorts,
        restClientWeather,
        GetIt.I.get<LocalStorage>()));

    return Future.value();
  }

  static Future initUseCase() async {
    GetIt.I.registerFactory<GetNearbyAirportsUseCase>(() =>
        GetNearbyAirportsUseCaseImpl(
            GetIt.I.get<BaseRepository>(),
            GetIt.I.get<LocationRepository>(),
            GetIt.I.get<Mapper<AirportDTO, AirportModel>>()));

    GetIt.I.registerFactory<GetWeatherUseCase>(() => GeWeatherUseCaseImpl(
        GetIt.I.get<BaseRepository>(),
        GetIt.I.get<LocationRepository>(),
        GetIt.I.get<Mapper<WeatherDto, WeatherModel>>()));

    GetIt.I.registerFactory<GetAirportsFromBookmarkUseCase>(() =>
        GetAirportsFromBookmarkUseCaseImp(
            GetIt.I.get<BaseRepository>(),
            GetIt.I.get<LocationRepository>(),
            GetIt.I.get<Mapper<AirportDTO, AirportModel>>()));

    GetIt.I.registerFactory<AddAirportToBookmarkUseCase>(() =>
        AddAirportToBookmarkUseCaseImp(
            GetIt.I.get<BaseRepository>(),
            GetIt.I.get<LocationRepository>(),
            GetIt.I.get<Mapper<AirportDTO, AirportModel>>()));

    return Future.value();
  }

  static Future injectPages() {
    GetIt.I.registerFactory<BlocProvider<SavedBloc>>(() => BlocProvider(
          create: (BuildContext context) => SavedBloc(),
          child: SavedPage(),
        ));

    GetIt.I.registerFactory<BlocProvider<SplashBloc>>(() => BlocProvider(
          create: (BuildContext context) =>
              SplashBloc(GetIt.I.get<LocationRepository>()),
          child: SplashPage(),
        ));

    GetIt.I.registerFactoryParam<BlocProvider<WeatherBloc>, WeatherModel, void>(
        (model, _) => BlocProvider(
              create: (BuildContext context) => WeatherBloc(model),
              child: WeatherPage(),
            ));

    GetIt.I.registerFactory<BlocProvider<AirportsBloc>>(() => BlocProvider(
          create: (BuildContext context) => AirportsBloc(
            GetIt.I.get<GetNearbyAirportsUseCase>(),
            GetIt.I.get<GetWeatherUseCase>(),
          ),
          child: AirportsPage(),
        ));

    return Future.value();
  }
}
