import 'package:Aevius/presenter/pages/root/settings/setting_page.dart';
import 'package:Aevius/presenter/pages/root/settings/settings_bloc.dart';
import 'package:Aevius/presenter/pages/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RootPage extends StatefulWidget {
  final Widget airports;
  final Widget bookmark;
  final Widget settings;

  const RootPage({Key key, this.airports, this.bookmark, this.settings})
      : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Offstage(
              child: widget.airports,
              offstage: _selectedIndex != 0,
            ),
            Offstage(
              child: widget.bookmark,
              offstage: _selectedIndex != 1,
            ),
            Offstage(
              child: widget.settings,
              offstage: _selectedIndex != 2,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Flights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.withOpacity(0.9),
        onTap: _onItemTapped,
      ),
    );
  }
}
