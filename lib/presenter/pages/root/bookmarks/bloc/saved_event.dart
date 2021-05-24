part of 'saved_bloc.dart';

abstract class SavedEvent {
  const SavedEvent();
}

class LoadBookmarksEvent extends SavedEvent {}

class DeleteAirportFromBookmarksEvent extends SavedEvent {
  final AirportModel model;

  DeleteAirportFromBookmarksEvent(this.model);
}

class LoadWeatherForAirport implements SavedEvent {
  final AirportModel airport;
  LoadWeatherForAirport(this.airport);
}

