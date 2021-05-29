import 'dart:convert';

import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences;

  static const String airportsKey = "airportsKey";
  static const String airportsSearchRadius = "airportsSearchRadius";

  LocalStorage(this.sharedPreferences);

  List<AirportDTO> getSavedAirports() {
    if (sharedPreferences.containsKey(airportsKey)) {
      var json = sharedPreferences.getString(airportsKey);
      var decoded = jsonDecode(json);
      var obj = airportToList(decoded);
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

  Future<bool> saveSearchAirportRadius(int radius) {
    return sharedPreferences.setInt(airportsSearchRadius, radius);
  }

  int getSearchAirportRadius() {
    return sharedPreferences.containsKey(airportsSearchRadius)
        ? sharedPreferences.getInt(airportsSearchRadius)
        : 100;
  }

  Future<List<AirportDTO>> deleteAirportFromBookmark(AirportDTO airport) async {
    if (sharedPreferences.containsKey(airportsKey)) {
      var airports = getSavedAirports();
      var index = airports.indexOf(airport);
      airports.removeAt(index);
      await sharedPreferences.setString(airportsKey, jsonEncode(airports));
      return Future.value(airports);
    } else {
      return Future.value([]);
    }
  }
}
