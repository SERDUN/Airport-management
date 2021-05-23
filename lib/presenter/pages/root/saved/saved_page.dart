import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/saved_bloc.dart';

class SavedPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<SavedPage> {
  SavedBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SavedBloc>(context);
    //_bloc.add(LoadNearbyAirports());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedBloc, SavedState>(
      listener: (ctx, state) {
        print("current state: " + state.toString());
      },
      child: BlocBuilder<SavedBloc, SavedState>(builder: (ctx, state) {
        return Scaffold(body: SafeArea(child: emptyState()));
      }),
    );
  }

  Widget emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/empty.png",
            width: 224,
            height: 224,
          ),
          Text("No saved airports"),
          Text("you can see your airports here after adding to favorites "),
        ],
      ),
    );
  }
}
