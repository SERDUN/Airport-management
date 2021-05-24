import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int valueHolder = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Search radius for nearby airports"),
        Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Slider(
                value: valueHolder.toDouble(),
                min: 1,
                max: 100,
                divisions: 100,
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                label: '${valueHolder.round()}',
                onChanged: (double newValue) {
                  setState(() {
                    valueHolder = newValue.round();
                  });
                },
                semanticFormatterCallback: (double newValue) {
                  return '${newValue.round()}';
                })),
        Text(
          '$valueHolder',
          style: TextStyle(fontSize: 22),
        ),
        Container(
            margin: EdgeInsets.all(8), child: Text("Clear all bookmarks")),
      ],
    ));
  }
}
