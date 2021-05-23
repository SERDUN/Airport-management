import 'package:Aevius/domain/entity/models/cloud_model.dart';

class WeatherModel {
  final String name;
  final String lastFetch;

  final String altimeterValue;
  final String flightsRule;
  final String visibility;
  final String windDirection;
  final String windSpeed;
  final String tmp;

  final List<CloudModel> clouds;

  WeatherModel(
    this.name, {
    this.lastFetch,
    this.altimeterValue,
    this.clouds,
    this.visibility,
    this.flightsRule,
    this.windDirection,
    this.windSpeed,
        this.tmp,
      });
}
