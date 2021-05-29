import 'dart:io';

import 'package:Aevius/config/env.dart';
import 'package:Aevius/data/repository/base_repository.dart';
import 'package:Aevius/data/repository/location_repository.dart';
import 'package:Aevius/data/source/local_storage.dart';
import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/mappers/airport_details_mapper.dart';
import 'package:Aevius/domain/entity/mappers/airport_mapper.dart';
import 'package:Aevius/domain/entity/mappers/weather_mapper.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/airport/GetAirportByCodeUseCase.dart';
import 'package:Aevius/domain/usecases/airport/GetAirportByCodeUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/bookmarks/AddAirportToBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/bookmarks/AddAirportToBookmarkUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/bookmarks/DeleteAirportFromBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/bookmarks/DeleteAirportFromBookmarkUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/bookmarks/GetAirportsFromBookmarkUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/bookmarks/GetAirportsFromBookmarksUseCase.dart';
import 'package:Aevius/domain/usecases/airport/GetNearbyAirportsUseCase.dart';
import 'package:Aevius/domain/usecases/airport/GetNearbyAirportsUseCaseImpl.dart';
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCase.dart';
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCaseImpl.dart';
import 'package:Aevius/presenter/pages/root/airports/airports_page.dart';
import 'package:Aevius/presenter/pages/root/airports/bloc/airports_bloc.dart';
import 'package:Aevius/presenter/pages/root/bookmarks/bloc/saved_bloc.dart';
import 'package:Aevius/presenter/pages/root/bookmarks/bookmark_page.dart';
import 'package:Aevius/presenter/pages/root/settings/setting_page.dart';
import 'package:Aevius/presenter/pages/root/settings/settings_bloc.dart';
import 'package:Aevius/presenter/pages/splash/bloc/splash_bloc.dart';
import 'package:Aevius/presenter/pages/splash/splash_page.dart';
import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:Aevius/presenter/pages/weather/weather_page.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
    GetIt.I.registerFactory<Mapper<AirportDetailsDTO, AirportModel>>(
        () => AirportDetailsMapper());
    GetIt.I.registerFactory<Mapper<AirportDTO, AirportModel>>(
        () => AirportMapper());
    GetIt.I.registerFactory<Mapper<WeatherDto, WeatherModel>>(
        () => WeatherMapper());
    return Future.value();
  }

  static Future initRepository() async {
    final options = CacheOptions(
      store: MemCacheStore(),
      // Default.
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.high,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    var sharedPreferences = await SharedPreferences.getInstance();
    RestClient restClientAirPorts = RestClient(base_url[URLS.NEARBY_AIRPORTS]);
    RestClient restClientWeather = RestClient(base_url[URLS.WEATHER]);
    RestClient restClientAirportDetails = RestClient(base_url[URLS.DETAILS_AIRPORT]);

    restClientAirPorts.dio.interceptors.add(PrettyDioLogger());
    restClientAirPorts.dio.interceptors.add(DioCacheInterceptor(options: options));
    restClientAirPorts.dio.options.queryParameters["key"]=aviationKey;

    restClientWeather.dio.interceptors.add(PrettyDioLogger());
    restClientWeather.dio.options.headers["Authorization"] = "BEARER  $weatherKey";

    restClientAirportDetails.dio.interceptors.add(DioCacheInterceptor(options: options));
    restClientAirportDetails.dio.interceptors.add(PrettyDioLogger());
    restClientAirportDetails.dio.options.headers['APC-Auth'] = airportDetailsKey;
    restClientAirportDetails.dio.options.headers['APC-Auth-Secret'] = airportDetailsSecret;

    GetIt.I.registerSingleton<LocalStorage>(LocalStorage(sharedPreferences));

    GetIt.I.registerSingleton<SharedPreferences>(sharedPreferences);

    GetIt.I.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl());
    GetIt.I.registerLazySingleton<BaseRepository>(
      () => BaseRepositoryImpl(
          restClientAirPorts,
          restClientWeather,
          GetIt.I.get<LocalStorage>(),
          restClientAirportDetails),
    );

    return Future.value();
  }

  static Future initUseCase() async {
    GetIt.I.registerFactory<GetNearbyAirportsUseCase>(() =>
        GetNearbyAirportsUseCaseImpl(
            GetIt.I.get<BaseRepository>(),
            GetIt.I.get<LocationRepository>(),
            GetIt.I.get<Mapper<AirportDTO, AirportModel>>()));

    GetIt.I.registerFactory<GetAirportByCodeUseCase>(() =>
        GetAirportByCodeUseCaseImpl(GetIt.I.get<BaseRepository>(),
            GetIt.I.get<Mapper<AirportDetailsDTO, AirportModel>>()));

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
            GetIt.I.get<Mapper<AirportDTO, AirportModel>>(),
            GetIt.I.get<Mapper<AirportDetailsDTO, AirportModel>>()));

    GetIt.I.registerFactory<DeleteAirportFromBookmarkUseCase>(() =>
        DeleteAirportFromBookmarkUseCaseImp(
            GetIt.I.get<BaseRepository>(),
            GetIt.I.get<LocationRepository>(),
            GetIt.I.get<Mapper<AirportDTO, AirportModel>>()));

    return Future.value();
  }

  static Future injectPages() {
    GetIt.I.registerFactory<BlocProvider<SavedBloc>>(() => BlocProvider(
          create: (BuildContext context) => SavedBloc(
            GetIt.I.get<GetAirportsFromBookmarkUseCase>(),
            GetIt.I.get<GetWeatherUseCase>(),
            deleteAirportFromBookmarkUseCase:
                GetIt.I.get<DeleteAirportFromBookmarkUseCase>(),
          ),
          child: SavedPage(),
        ));

    GetIt.I.registerFactory<BlocProvider<SettingsBloc>>(() => BlocProvider(
          create: (BuildContext context) => SettingsBloc(),
          child: SettingPage(),
        ));

    GetIt.I.registerFactory<BlocProvider<SplashBloc>>(() => BlocProvider(
          create: (BuildContext context) =>
              SplashBloc(GetIt.I.get<LocationRepository>()),
          child: SplashPage(),
        ));

    GetIt.I.registerFactoryParam<
            BlocProvider<WeatherBloc>, WeatherModel, AirportModel>(
        (model, airportModel) => BlocProvider(
              create: (BuildContext context) => WeatherBloc(
                  model,
                  GetIt.I.get<AddAirportToBookmarkUseCase>(),
                  airportModel,
                ),
              child: WeatherPage(),
            ));

    GetIt.I.registerFactory<BlocProvider<AirportsBloc>>(() => BlocProvider(
          create: (BuildContext context) => AirportsBloc(
            GetIt.I.get<GetNearbyAirportsUseCase>(),
            GetIt.I.get<GetWeatherUseCase>(),
            addAirportToBookmarkUseCase:
                GetIt.I.get<AddAirportToBookmarkUseCase>(),
          ),
          child: AirportsPage(),
        ));

    return Future.value();
  }
}
