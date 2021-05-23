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
                Container(
                  color: Colors.blue,
                  height: 80,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.weatherModel.clouds.length,
                      itemBuilder: (context, index) {
                        var airport = state.weatherModel.clouds[index];
                        return Container(
                          width: 80,
                          height: 80,
                          color: Colors.red,
                        );
                      },
                    ),
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
                  children: [Text("Temperature"), Spacer(), Text(model.tmp)],
                ),

                // Table(
                //   defaultColumnWidth: FixedColumnWidth(120.0),
                //   border: TableBorder.all(
                //       color: Colors.black, style: BorderStyle.solid, width: 1),
                //   children: [
                //     TableRow(children: [
                //       Column(children: [Text('repr', style: TextStyle(fontSize: 20.0))]),
                //       Column(children: [Text('value', style: TextStyle(fontSize: 20.0))]),
                //       Column(children: [Text('spoken', style: TextStyle(fontSize: 20.0))]),
                //     ]),
                //     TableRow(children: [
                //       Column(children: [Text('')]),
                //       Column(children: [Text('')]),
                //       Column(children: [Text('*')]),
                //     ]),
                //     TableRow(children: [
                //       Column(children: [Text('')]),
                //       Column(children: [Text('')]),
                //       Column(children: [Text('*')]),
                //     ]),
                //     TableRow(children: [
                //       Column(children: [Text('')]),
                //       Column(children: [Text('')]),
                //       Column(children: [Text('*')]),
                //     ]),
                //   ],
                // )

                //buildTable()
                // buildNearbyAirportsPage()
              ],
            ),
          ),
        ));
      }),
    );
  }

  Center buildTable() {
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: [
              Column(children: [Text('1', style: TextStyle(fontSize: 20.0))]),
              Column(children: [Text('1', style: TextStyle(fontSize: 20.0))]),
              Column(children: [Text('1', style: TextStyle(fontSize: 20.0))]),
            ]),
            TableRow(children: [
              Column(children: [Text('')]),
              Column(children: [Text('')]),
              Column(children: [Text('*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('')]),
              Column(children: [Text('')]),
              Column(children: [Text('*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('')]),
              Column(children: [Text('')]),
              Column(children: [Text('*')]),
            ]),
          ],
        ),
      ),
    ]));
  }
}
