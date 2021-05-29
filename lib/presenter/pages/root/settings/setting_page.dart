import 'package:Aevius/presenter/common/dialogs/dialog_delegate.dart';
import 'package:Aevius/presenter/common/style/thema.dart';
import 'package:Aevius/presenter/pages/root/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _valueHolder = 0;
  SettingsBloc _bloc;
  var dialogDelegate = DialogDelegate();

  @override
  void initState() {
    _bloc = BlocProvider.of<SettingsBloc>(context);
    _bloc.add(GetCurrentRadiusEvent());
    _valueHolder = _bloc.state.currentRadius;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(listener: (ctx, state) {
      if (state is SettingsInitial) {
        _valueHolder = state.currentRadius;
      }
    }, child: BlocBuilder<SettingsBloc, SettingsState>(builder: (ctx, state) {
      return SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Airport search radius",
                style: h20BlackStyle,
              )),
          Row(children: [
            Container(
                child: Expanded(
              child: Slider(
                  value: _valueHolder.toDouble(),
                  min: 10,
                  max: 1000,
                  divisions: 1000,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  label: '${_valueHolder.round()}',
                  onChanged: (double newValue) {
                    setState(() {
                      _valueHolder = newValue.round();
                      _bloc.add(UpdateCurrentRadiusEvent(_valueHolder));
                    });
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '${newValue.round()}';
                  }),
            )),
            Container(
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  '$_valueHolder',
                  style: TextStyle(fontSize: 22),
                )),
          ]),
          // Container(
          //     margin: EdgeInsets.only(top: 16,bottom: 24,left: 16,right: 16),
          //     child: Text(
          //       "Preferences",
          //       style: h20BlackStyle,
          //     )),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 24),
          //     child: Container(
          //       child: Text("Clear bookmarks"),
          //     )),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 24),
          //
          //   child: Divider(color: Colors.black.withOpacity(0.5),),
          //)
        ],
      ));
    }));
  }
}
