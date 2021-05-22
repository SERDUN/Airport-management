import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/presenter/pages/splash/splash_bloc.dart';
import 'package:Aevius/presenter/pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiInjector {
  static Future initRepository() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var dioRestClient = new RestClient(sharedPreferences);

    //register data source
    GetIt.I.registerSingleton<SharedPreferences>(sharedPreferences);
    GetIt.I.registerSingleton<RestClient>(dioRestClient);

    return Future.value();
  }

  static Future init() async {
    await initRepository();
    await injectPages();

    return Future.value();
  }

  static Future injectPages() {
    // GetIt.I.registerFactory<BlocProvider<SplashBloc>>(() => BlocProvider(
    //       create: (BuildContext context) =>
    //           SplashBloc(GetIt.instance.get<AuthRepository>()),
    //       child: SplashPage(),
    //     ));

    return Future.value();
  }
}
