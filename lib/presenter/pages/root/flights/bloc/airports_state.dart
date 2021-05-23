part of 'airports_bloc.dart';

abstract class AirportsState extends Equatable {
  final List<AirportModel> airports;

  AirportsState(this.airports);
}

class AirportsInitial extends AirportsState {
  AirportsInitial(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [];
}

class AirportsLoaded extends AirportsState {
  AirportsLoaded(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [];
}

