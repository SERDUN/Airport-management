import 'package:Aevius/presenter/common/ui/base_indicator.dart';
import 'package:Aevius/presenter/pages/root/flights/bloc/airports_bloc.dart';
import 'package:Aevius/presenter/pages/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirportsPage extends StatefulWidget {
  @override
  _AirportsPageState createState() => _AirportsPageState();
}

class _AirportsPageState extends State<AirportsPage> {
  TextEditingController _controller = TextEditingController();
  AirportsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<AirportsBloc>(context);
    _bloc.add(LoadNearbyAirports());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
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
        buildNearbyAirportsPage()
      ],
    ));
  }

  Widget buildNearbyAirportsPage() {
    return BlocListener<AirportsBloc, AirportsState>(
      listener: (ctx, state) {
        print("current state: " + state.toString());
        if (state is LocationAllow) {
          //actionOpenHome();
        }
      },
      child: BlocBuilder<AirportsBloc, AirportsState>(
        builder: (ctx, state) {
          if (state is AirportsLoaded) {
            return Expanded(
                child: ListView.builder(

              itemCount: state.airports.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${state.airports[index].name}'),
                );
              },
            ));
          } else
            return BaseIndicator();
        },
      ),
    );
  }
}
