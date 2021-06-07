import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:Aevius/presenter/common/ui/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AirportItemWidget extends StatelessWidget {
  final AirportModel airportModel;
  final Function(AirportModel) callback;
  final Function(AirportModel) addToBookmark;

  const AirportItemWidget(
      {Key key, this.airportModel, this.callback, this.addToBookmark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        child: Card(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${airportModel.name}',
                    style: h16Black,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  RowWidget("Airport code: : ", airportModel.code),
                  RowWidget("Distance: ", airportModel.distance.toString()),
                  RowWidget("Country: ", airportModel.country),
                  RowWidget("Time zone: ", airportModel.timeZone)
                ],
              )),
              IconButton(
                icon: Icon(Icons.bookmark),
                color: airportModel.isInBookmark ? Colors.black : Colors.grey,
                onPressed: () => addToBookmark(airportModel),
              )
            ],
          ),
        )),
        onTap: () => callback(airportModel),
      ),
    );
  }
}
