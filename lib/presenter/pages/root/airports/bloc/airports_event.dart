part of 'airports_bloc.dart';

abstract class AirportsEvent {}

class LoadNearbyAirports implements AirportsEvent {}

class LoadWeatherForAirport implements AirportsEvent {
  final AirportModel airport;
  LoadWeatherForAirport(this.airport);
}

class FindWeatherByCodeEvent implements AirportsEvent {
  final String code;

  FindWeatherByCodeEvent(this.code);
}

class AddAirportTooBookmarkEvent extends AirportsEvent {
  final AirportModel airport;

  AddAirportTooBookmarkEvent(this.airport);
}
