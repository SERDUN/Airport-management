part of 'airports_bloc.dart';

abstract class AirportsEvent  {
}

class LoadNearbyAirports implements AirportsEvent {}
class LoadWeatherForAirport implements AirportsEvent {
  final AirportModel airport;

  LoadWeatherForAirport(this.airport);
}
