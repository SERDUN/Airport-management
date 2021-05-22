import 'package:Aevius/data/repository/location_repository.dart';
import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/presenter/pages/splash/splash_bloc.dart';
import 'package:Aevius/presenter/pages/splash/splash_page.dart';
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
    var dioRestClient = new RestClient(sharedPreferences);

    //register data source
    GetIt.I.registerSingleton<SharedPreferences>(sharedPreferences);
    GetIt.I.registerSingleton<RestClient>(dioRestClient);

    GetIt.I.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl());

    return Future.value();
  }

  static Future injectPages() {
    var repo=GetIt.I.get<LocationRepository>();
    GetIt.I.registerFactory<BlocProvider<SplashBloc>>(() => BlocProvider(
          create: (BuildContext context) => SplashBloc(repo),
          child: SplashPage(),
        ));

    return Future.value();
  }
}
