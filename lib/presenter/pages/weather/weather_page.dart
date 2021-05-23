import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController _controller = TextEditingController();
  WeatherBloc _bloc;

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
        print("current state: " + state.toString());
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
                    // do something
                  },
                )
              ],
            ),
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        margin: EdgeInsets.all(16),
                        child: Text("Meteorological data for ")),
                    Row(
                      children: [
                        Text("Last station update"),
                        Spacer(),
                        Text(model.lastFetch)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Altimeter"),
                        Spacer(),
                        Text(model.altimeterValue)
                      ],
                    ),
                    Text("Clouds"),
                    state.weatherModel.clouds.isEmpty
                        ? Text("For this airport not data about cloudy")
                        : Container(
                            height: 124,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.weatherModel.clouds.length,
                              itemBuilder: (context, index) {
                                var airport = state.weatherModel.clouds[index];
                                return buildItem(
                                    airport.cloudsType, airport.cloudsAltitude);
                              },
                            ),
                          ),
                    Row(
                      children: [
                        Text("Flights rule"),
                        Spacer(),
                        Text(model.flightsRule)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Visibility"),
                        Spacer(),
                        Text(model.visibility)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Wind directions"),
                        Spacer(),
                        Text(model.windDirection)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Wind speed"),
                        Spacer(),
                        Text(model.windSpeed)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Temperature"),
                        Spacer(),
                        Text(model.tmp)
                      ],
                    ),
                  ],
                ),
              ),
            ));
      }),
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

            // has the effect of softening the shadow
            spreadRadius: 0.2,
            // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              2, // vertical, move down 10
            ),
          )
        ],
        borderRadius: new BorderRadius.all(Radius.circular(8)));
  }
}
