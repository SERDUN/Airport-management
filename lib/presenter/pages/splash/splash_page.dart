import 'package:Aevius/presenter/common/ui/base_indicator.dart';
import 'package:Aevius/presenter/common/ui/logo_widget.dart';
import 'package:Aevius/presenter/pages/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main_routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SplashBloc>(context);
    _bloc.add(CheckPermissionLocationEvent());
    super.initState();
  }

  void actionRequestForLocation() {
    _bloc.add(RequestPermissionLocationEvent());
  }

  void actionOpenSettings() {
    _bloc.add(OpenSettingsPermissionLocationEvent());
  }

  void actionOpenHome() {
    Navigator.pushReplacementNamed(context, MainNavigatorRoutes.root);
  }

  @override
  Widget build(BuildContext context) {
    //  return buildPage();
    // return Scaffold(
    body:
    return Scaffold(
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: LogoWidget(),
                margin: EdgeInsets.only(bottom: 24),
              ),
              BlocListener<SplashBloc, SplashState>(
                listener: (ctx, state) {
                  if (state is LocationAllow) {
                    actionOpenHome();
                  }
                },
                child: BlocBuilder<SplashBloc, SplashState>(
                  builder: (ctx, state) {

                    switch (state.runtimeType) {
                      case PermissionLocationInitial:
                        return BaseIndicator();
                      case LocationAllow:
                        return BaseIndicator();

                    // return ProgressIndicatorWidget();
                      case LocationDenny:
                        return BaseIndicator();

                    // return buildScaffold(
                      //     buttonTitle: "Turn on location",
                      //     call: actionRequestForLocation);
                      case LocationDennyForever:
                        return BaseIndicator();

                    // return buildScaffold(
                      //     buttonTitle: "Setting", call: actionOpenSettings);
                      default:
                        return BaseIndicator();

                    // return buildScaffold(
                      //     buttonTitle: "Setting", call: actionOpenSettings);
                    }
                  },
                ),
              ),
            ]),
      ),
    );
    ;
  }

// Widget buildPage() {
//   return Container(
//     child: Stack(
//       children: <Widget>[
//         Center(
//           child: LogoWidget(),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 Container(
//                   child: Text(
//                     "Weather for you",
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.grey,
//                         fontFamily: 'GochiHands'),
//                   ),
//                   margin: EdgeInsets.only(bottom: 8),
//                 )
//               ],
//             )
//           ],
//         ),
//       ],
//     ),
//   );
// }
}
