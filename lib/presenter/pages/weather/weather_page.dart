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
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.all(16),
              child: Text("Look weather by airport key")),
          Container(
            margin: EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                child: TextField(
                  decoration: new InputDecoration(
                      hintText: "Enter airport code",
                      labelStyle: new TextStyle(color: const Color(0xFF424242)),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.red)),
                      suffixIcon: IconButton(
                        onPressed: () => _controller.clear(),
                        icon: Icon(Icons.search_sharp),
                      )),
                  controller: _controller,
                ),
              ),
            ]),
          ),
          Container(
              margin: EdgeInsets.all(16),
              child: Text("Nearby "
                  "airports")),
          // buildNearbyAirportsPage()
        ],
      ),
    ));
  }

// Widget buildNearbyAirportsPage() {
//   return BlocListener<WeatherBloc, WeatherState>(
//     listener: (ctx, state) {
//       print("current state: " + state.toString());
//
//     },
//     child: BlocBuilder<WeatherBloc, WeatherState>(
//       builder: (ctx, state) {
//    r
//     ),
//   );
// }
}
