part of 'airports_bloc.dart';

abstract class AirportsState extends Equatable {
  final List<AirportModel> airports;

  AirportsState(this.airports);
}

class AirportsInitial extends AirportsState {
  AirportsInitial(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [airports,DateTime.now().microsecondsSinceEpoch];
}

class AirportsLoaded extends AirportsState {
  AirportsLoaded(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [airports,DateTime.now().microsecondsSinceEpoch];
}

class WeatherLoaded extends AirportsState {
  final WeatherModel weatherModel;

  WeatherLoaded(List<AirportModel> airports, this.weatherModel)
      : super(airports);

  @override
  List<Object> get props => [airports,DateTime.now().microsecondsSinceEpoch];
}
