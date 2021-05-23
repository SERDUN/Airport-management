import 'package:Aevius/presenter/common/dialogs/dialog_delegate.dart';
import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:Aevius/presenter/pages/root/bookmarks/airoport_item_widget.dart';
import 'package:Aevius/presenter/common/ui/base_indicator.dart';
import 'package:Aevius/presenter/pages/root/bookmarks/bookmark_empty_state.dart';
import 'package:Aevius/presenter/pages/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'bloc/saved_bloc.dart';

class SavedPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<SavedPage> {
  SavedBloc _bloc;
  Key bookmarkKey = Key("BOOKMARK");
  var dialogDelegate = DialogDelegate();

  @override
  void initState() {
    _bloc = BlocProvider.of<SavedBloc>(context);
    _bloc.add(LoadBookmarksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: bookmarkKey,
        onVisibilityChanged: (VisibilityInfo info) =>
            _bloc.add(LoadBookmarksEvent()),
        child: Scaffold(
            body: SafeArea(
                child: BlocListener<SavedBloc, SavedState>(
          listener: (ctx, state) {
            if (state is AirportFailureState) {
              dialogDelegate
                  .of(context)
                  .initTitle("Failure")
                  .initDescription(state.message)
                  .initActionTitle1("oK")
                  .showInfoDialog();
            }
            if (state is AirportMessageState) {
              dialogDelegate
                  .of(context)
                  .initTitle(state.message)
                  .showInfoSnakeBar();
            }
          },
          child: BlocBuilder<SavedBloc, SavedState>(builder: (ctx, state) {
            if (state is SavedInitial) return BaseIndicator();
            if (state is AirportsEmptyState)
              return BookmarkEmptyState();
            else
              return buildListView(state);
            //  return child: emptyState()));
          }),
        ))));
  }

  Widget buildListView(SavedState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Text(
            "Your saved airports",
            style: h20BlackStyle,
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: state.airports.length,
          itemBuilder: (context, index) {
            var airport = state.airports[index];
            return AirportItemWidget(
              airportModel: airport,
              onDelete: (model) =>
                  _bloc.add(DeleteAirportFromBookmarksEvent(model)),
            );
          },
        ))
      ],
    );
  }
}
