import 'package:Aevius/presenter/argument/weather_airports_arg.dart';
import 'package:Aevius/presenter/common/dialogs/dialog_delegate.dart';
import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:Aevius/presenter/common/ui/base_indicator.dart';
import 'package:Aevius/presenter/pages/root/airports/airoport_item_widget.dart';
import 'package:Aevius/presenter/pages/splash/bloc/splash_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../main_routes.dart';
import 'bloc/airports_bloc.dart';

class AirportsPage extends StatefulWidget {
  @override
  _AirportsPageState createState() => _AirportsPageState();
}

// todo handle error
class _AirportsPageState extends State<AirportsPage> {
  TextEditingController _controller = TextEditingController();
  var dialogDelegate = DialogDelegate();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Key airportsKey = Key("AIRPORTS");

  AirportsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<AirportsBloc>(context);
   // _bloc.add(LoadNearbyAirports());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              "Look weather by airport key",
              style: h20BlackStyle,
            )),
        Container(
          margin: EdgeInsets.all(16),
          child: Row(children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  _bloc
                      .add(FindWeatherByCodeEvent(_controller.text.toString()));
                },
                decoration: new InputDecoration(
                    hintText: "Enter airport code",
                    labelStyle: new TextStyle(color: const Color(0xFF424242)),
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red)),
                    suffixIcon: IconButton(
                      onPressed: () => _bloc.add(
                          FindWeatherByCodeEvent(_controller.text.toString())),
                      icon: Icon(Icons.search_sharp),
                    )),
                controller: _controller,
              ),
            ),
          ]),
        ),
        Expanded(child: buildNearbyAirportsPage()),
      ],
    ));
  }

  Widget buildNearbyAirportsPage() {
    return VisibilityDetector(
        key: airportsKey,
        onVisibilityChanged: (VisibilityInfo info) =>
            _bloc.add(LoadNearbyAirports(isVisibleLoader: false)),
        child: BlocListener<AirportsBloc, AirportsState>(
          listener: (ctx, state) {
            if (state is WeatherLoaded) {
              _refreshController.refreshCompleted();
              Navigator.pushNamed(context, MainNavigatorRoutes.weather,
                  arguments: WeatherAirportArg(
                      state.weatherModel, state.selectedAirport));
            }

            if (state is AirportWasAddedToBookmark) {
              _refreshController.refreshCompleted();
              dialogDelegate
                  .of(context)
                  .initTitle("Airport added to bookmark")
                  .showInfoSnakeBar();
            }

            if (state is AirportWasDeletedFromBookmark) {
              _refreshController.refreshCompleted();
              dialogDelegate
                  .of(context)
                  .initTitle("Airport deleted from bookmark")
                  .showInfoSnakeBar();
            }

            if (state is AirportsLoaded) {
              _refreshController.refreshCompleted();
            }
            if (state is AirportFailureState) {
              _refreshController.refreshCompleted();

              dialogDelegate
                  .of(context)
                  .initTitle("Failure")
                  .initDescription(state.message)
                  .initActionTitle1("oK")
                  .showInfoDialog();
            }
          },
          child:
              BlocBuilder<AirportsBloc, AirportsState>(builder: (ctx, state) {
            return Container(
                child: Stack(children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(16),
                          child: Text(
                            "Nearby "
                            "airports",
                            style: h20BlackStyle,
                          ))
                    ],
                  ),
                  Expanded(
                      child: Theme(
                          data: Theme.of(context)
                              .copyWith(primaryColor: Colors.black),
                          child: SmartRefresher(
                            enablePullDown: true,
                            enablePullUp: false,
                            controller: _refreshController,
                            onRefresh: _onRefresh,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.airports.length,
                              itemBuilder: (context, index) {
                                var airport = state.airports[index];
                                return AirportItemWidget(
                                  airportModel: airport,
                                  callback: (model) {
                                    _bloc.add(LoadWeatherForAirport(airport));
                                  },
                                  addToBookmark: (model) {
                                    _bloc
                                        .add(AddAirportTooBookmarkEvent(model));
                                  },
                                );
                              },
                            ),
                          ))),
                ],
              ),
              state is AirportsInitial ? BaseIndicator() : SizedBox(),
              state is LocationNotDetectedFailureState
                  ? locationNotDetect()
                  : SizedBox()
            ]));
          }),
        ));
  }

  Center locationNotDetect() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your location not detected ",
            style: h14Grey,
          ),
          SizedBox(
            height: 16,
          ),
          OutlinedButton(
              onPressed: () {
                _bloc.add(LoadNearbyAirports());
              },
              child: Text("Try again"))
        ],
      ),
    );
  }

  void _onRefresh() async {
    _bloc.add(LoadNearbyAirports());
  }
}
