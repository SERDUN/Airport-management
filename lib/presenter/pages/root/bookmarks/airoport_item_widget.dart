import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AirportItemWidget extends StatelessWidget {
 final AirportModel airportModel;
 final Function(AirportModel) callback;

  const AirportItemWidget({Key key, this.airportModel, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.all(16),
      child: InkWell(
        child: Card(
          child: ListTile(
            title: Text('${airportModel.name}'),
          ),
        ),
        onTap: () =>callback(airportModel),
      ),
    );
  }
}
