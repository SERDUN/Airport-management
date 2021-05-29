import 'package:Aevius/presenter/common/dialogs/dialog_delegate.dart';
import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:Aevius/presenter/common/ui/base_indicator.dart';
import 'package:Aevius/presenter/common/ui/row_widget.dart';
import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherBloc _bloc;
  var dialogDelegate = DialogDelegate();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _bloc = BlocProvider.of<WeatherBloc>(context);
    //_bloc.add(LoadNearbyAirports());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (ctx, state) {
        if (state is AirportWasAddedToBookmark) {
          dialogDelegate
              .of(context)
              .initTitle("Airport added to bookmark")
              .showInfoSnakeBar();
        }

        if (state is WeatherFailureState) {
          _refreshController.refreshCompleted();

          dialogDelegate
              .of(context)
              .initTitle("Failure")
              .initDescription(state.message)
              .initActionTitle1("oK")
              .showInfoDialog();
        }
        if (state is WeatherInitial) {
          dialogDelegate
              .of(context)
              .initTitle("The latest data was received from the server")
              .showInfoSnakeBar();
          _refreshController.refreshCompleted();
        }
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (ctx, state) {
        var model = state.weatherModel;
        return Scaffold(
            appBar: AppBar(
              title: Text('Details'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: background_dark,
                  ),
                  onPressed: () {
                    _bloc.add(AddAirportTooBookmarkEvent());
                  },
                )
              ],
            ),
            body: Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.black),
                child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: false,
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: SingleChildScrollView(
                      child: SafeArea(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                              margin: EdgeInsets.all(16),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Airport code: ${state.airportModel.code}",
                                          style: h16BlackStyle,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      buildMessageAboutCriricalChanging(state),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Time: ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Last update: ",
                                        model.timeDt,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Coordinated Universal Time: ",
                                        model.timeRept,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Altimeter: ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Pressure: ",
                                        model.altimeterRepr,
                                        isEnabledSpacer: true,
                                      ),
                                      RowWidget(
                                        "Value: ",
                                        model.altimeterValue + " hPa",
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Clouds",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      buildCloudyPart(state),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Raw: ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        model.raw,
                                        style: h14Black,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Sanitized: ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        model.sanitized,
                                        style: h14Black,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Common: ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Remark",
                                        model.remark,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Flights rule",
                                        model.flightsRule,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Temperature",
                                        model.tmp,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Visibility: ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Repr: ",
                                        model.visibilityRepr,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Value: ",
                                        model.visibilityValue,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Spoken: ",
                                        model.visibilitySpoken,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Wind ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Direction: ",
                                        model.windGust,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Gust: ",
                                        model.windDirection,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Speed: ",
                                        model.windSpeed,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "dewpoint ",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Repr: ",
                                        model.dewpointRepr,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "value: ",
                                        model.dewpointValue,
                                        isEnabledSpacer: true,
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Metadata",
                                        style: h16Black,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RowWidget(
                                        "Station",
                                        model.station,
                                        isEnabledSpacer: true,
                                      ),
                                      RowWidget(
                                        "Timestamp",
                                        model.metaTimestamp,
                                        isEnabledSpacer: true,
                                      ),
                                      RowWidget(
                                        "Last station update: ",
                                        model.metaLastStationUpdate,
                                        isEnabledSpacer: true,
                                      ),
                                    ],
                                  ),
                                  (state is WeatherProgress)
                                      ? BaseIndicator()
                                      : SizedBox()
                                ],
                              )),
                        ),
                      ),
                    ))));
      }),
    );
  }

  Card buildMessageAboutCriricalChanging(WeatherState state) {
    return state.weatherModel
                                            .isWeatherWasCriticalChanged
                                        ? Card(
                                            child: Container(
                                                margin: EdgeInsets.all(8),
                                                child: Text(
                                                  "The weather has changed "
                                                  "significantly "
                                                  "recently",
                                                  style: h14Black,
                                                )),
                                          )
                                        : Card(
                                            child: Container(
                                              margin: EdgeInsets.all(8),
                                              child: Text(
                                                "The weather has not changed "
                                                "significantly lately",
                                                style: h14Black,
                                              ),
                                            ),
                                          );
  }

  StatelessWidget buildCloudyPart(WeatherState state) {
    return state.weatherModel.clouds.isEmpty
        ? Text(
            "For this airport not data about "
            "cloudy",
            style: h14LightGrey,
          )
        : Container(
            height: 124,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.weatherModel.clouds.length,
              itemBuilder: (context, index) {
                var airport = state.weatherModel.clouds[index];
                return buildItem(airport.cloudsType, airport.cloudsAltitude);
              },
            ),
          );
  }

  Widget buildItem(
    String type,
    String altitude,
  ) {
    return Container(
        width: 124,
        decoration: getShadow(),
        margin: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 24, left: 8),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "Altitude: ",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF556474)),
                        ),
                        Text(
                          altitude,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF556474)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16, top: 8, left: 8),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "Type: ",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF556474)),
                        ),
                        Text(
                          type,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF556474)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  BoxDecoration getShadow() {
    return new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A57AFF7),
            blurRadius: 10,
            spreadRadius: 0.2,
            offset: Offset(
              0,
              2,
            ),
          )
        ],
        borderRadius: new BorderRadius.all(Radius.circular(8)));
  }

  void _onRefresh() async {
    _bloc.add(FetchWeatherEvent());
  }
}
