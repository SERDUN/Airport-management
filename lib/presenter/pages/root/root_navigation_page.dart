import 'package:Aevius/presenter/pages/root/flights/bloc/airports_bloc.dart';
import 'package:Aevius/presenter/pages/root/saved/bloc/saved_bloc.dart';
import 'package:Aevius/presenter/pages/root/settings/setting_page.dart';
import 'package:Aevius/presenter/pages/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'flights/airports_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  List<Widget> pages = [
    GetIt.I.get<BlocProvider<AirportsBloc>>(),
    GetIt.I.get<BlocProvider<SavedBloc>>(),
    SettingPage()
  ];

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
        child: pages[_selectedIndex],
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
