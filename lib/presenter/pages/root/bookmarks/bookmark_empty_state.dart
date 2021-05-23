import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookmarkEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return emptyState();
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
          Text(
            "No saved airports",
            style: bigGreyStyle,
          ),
          Container(
            child: Text(
              "you can see your airports here after adding to favorites ",
              textAlign: TextAlign.center,
              style: h16InactiveStyle,
            ),
            margin: EdgeInsets.only(left: 24,right: 24,top: 16),
          ),
        ],
      ),
    );
  }
}
