part of 'airports_bloc.dart';

abstract class AirportsState extends Equatable {
  const AirportsState();
}

class AirportsInitial extends AirportsState {
  @override
  List<Object> get props => [];
}
