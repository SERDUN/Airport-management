part of 'airports_bloc.dart';

abstract class AirportsState extends Equatable {
  final List<AirportModel> airports;

  AirportsState(this.airports);
}

class AirportsInitial extends AirportsState {
  AirportsInitial(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [airports, DateTime.now().microsecondsSinceEpoch];
}

class AirportsLoaded extends AirportsState {
  AirportsLoaded(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [airports, DateTime.now().microsecondsSinceEpoch];
}

class WeatherLoaded extends AirportsState {
  final WeatherModel weatherModel;
  final AirportModel selectedAirport;

  WeatherLoaded(List<AirportModel> airports, this.weatherModel, this.selectedAirport)
      : super(airports);

  @override
  List<Object> get props => [airports, DateTime.now().microsecondsSinceEpoch];
}

class AirportFailureState extends AirportsState {
  final String message;

  AirportFailureState(List<AirportModel> airports, this.message)
      : super(airports);

  @override
  List<Object> get props => [airports, DateTime.now().microsecondsSinceEpoch,message];
}
