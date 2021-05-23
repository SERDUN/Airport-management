part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  final List<AirportModel> airports;

  SavedState(this.airports);
}

class SavedInitial extends SavedState {
  SavedInitial(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [];
}

class AirportsReadyState extends SavedState {
  AirportsReadyState(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [airports, DateTime.now().microsecondsSinceEpoch];
}
class AirportsEmptyState extends SavedState {
  AirportsEmptyState(List<AirportModel> airports) : super(airports);

  @override
  List<Object> get props => [airports, DateTime.now().microsecondsSinceEpoch];
}

class AirportFailureState extends SavedState {
  final String message;

  AirportFailureState(List<AirportModel> airports, this.message)
      : super(airports);

  @override
  List<Object> get props =>
      [airports, DateTime.now().microsecondsSinceEpoch, message];
}
