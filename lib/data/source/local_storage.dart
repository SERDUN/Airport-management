import 'dart:convert';

import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences;

  static const String airportsKey = "airportsKey";

  LocalStorage(this.sharedPreferences);

  List<AirportDTO> getSavedAirports() {
    if (sharedPreferences.containsKey(airportsKey)) {
      var json = sharedPreferences.get(airportsKey);
      var obj = airportToList(json);
      return obj;
    } else {
      return [];
    }
  }

  Future<bool> addAirportToBookmark(AirportDTO airport) {
    if (sharedPreferences.containsKey(airportsKey)) {
      var airports = getSavedAirports();
      airports.add(airport);
      return sharedPreferences.setString(airportsKey, jsonEncode(airports));
    } else {
      return sharedPreferences.setString(airportsKey, jsonEncode([airport]));
    }
  }
}
