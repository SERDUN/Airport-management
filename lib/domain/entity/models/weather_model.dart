import 'package:Aevius/domain/entity/models/cloud_model.dart';

class WeatherModel {
  final String metaLastStationUpdate;
  final String metaTimestamp;
  final String altimeterValue;
  final String altimeterRepr;
  final String flightsRule;
  final String visibilityRepr;
  final String visibilityValue;
  final String visibilitySpoken;
  final String windDirection;
  final String windSpeed;
  final String windGust;
  final String tmp;
  final String station;
  final String raw;
  final String sanitized;
  final String timeDt;
  final String timeRept;
  final String remark;

  final String dewpointRepr;
  final String dewpointValue;

  final List<CloudModel> clouds;

  bool isWeatherWasCriticalChanged;

  WeatherModel({
    this.windGust,
    this.metaTimestamp,
    this.station,
    this.dewpointRepr,
    this.dewpointValue,
    this.raw,
    this.sanitized,
    this.metaLastStationUpdate,
    this.timeDt,
    this.timeRept,
    this.remark,
    this.altimeterValue,
    this.visibilityValue,
    this.visibilitySpoken,
    this.isWeatherWasCriticalChanged,
    this.clouds,
    this.altimeterRepr,
    this.visibilityRepr,
    this.flightsRule,
    this.windDirection,
    this.windSpeed,
    this.tmp,
  });
}
