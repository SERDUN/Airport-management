import 'package:flutter/widgets.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Text("Search radius for nearby airports"),
              Spacer(),
              Text("10km")
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(8), child: Text("Clear all bookmarks")),
      ],
    ));
  }
}
