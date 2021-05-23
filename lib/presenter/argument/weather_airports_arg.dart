import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';

class WeatherAirportArg{
  final WeatherModel weatherModel;
  final AirportModel airportModel;

  WeatherAirportArg(this.weatherModel, this.airportModel);
}