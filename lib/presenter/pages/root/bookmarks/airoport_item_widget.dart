import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AirportItemWidget extends StatelessWidget {
  final AirportModel airportModel;
  final Function(AirportModel) callback;
  final Function(AirportModel) onDelete;

  const AirportItemWidget(
      {Key key, this.airportModel, this.callback, this.onDelete})
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
                  buildRow("Airport code: : ", airportModel.code),
                  buildRow("Distance: ", airportModel.getDistance()),
                  buildRow("Country: ", airportModel.country),
                  buildRow("Time zone: ", airportModel.timeZone)
                ],
              )),
              IconButton(
                  onPressed: () => onDelete(airportModel),
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ))
            ],
          ),
        )),
        onTap: () => callback(airportModel),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return (title == null || value == null)
        ? SizedBox()
        : Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            title,
            style: h14LightGrey,
          ),
          Text(
            value,
            style: h14Grey,
          )
        ],
      ),
    );
  }
}
