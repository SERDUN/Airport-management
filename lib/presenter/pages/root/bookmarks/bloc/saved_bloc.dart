import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/usecases/DeleteAirportFromBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/GetAirportsFromBookmarksUseCase.dart';
import 'package:Aevius/domain/usecases/GetWeatherUseCase.dart';
import 'package:Aevius/presenter/pages/root/airports/bloc/airports_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_event.dart';

part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final GetAirportsFromBookmarkUseCase getAirportsFromBookmarkUseCase;
  final DeleteAirportFromBookmarkUseCase deleteAirportFromBookmarkUseCase;
  final GetWeatherUseCase getWeatherUseCase;

  SavedBloc(this.getAirportsFromBookmarkUseCase, this.getWeatherUseCase,
      {this.deleteAirportFromBookmarkUseCase})
      : super(SavedInitial([]));

  @override
  Stream<SavedState> mapEventToState(
    SavedEvent event,
  ) async* {
    if (event is LoadBookmarksEvent) yield* handleGettingAirports();
    if (event is DeleteAirportFromBookmarksEvent)
      yield* handleDeletingAirports(event.model);

    if (event is LoadWeatherForAirport)
      yield* handleGettingWeather(event.airport);
  }

  Stream<SavedState> handleGettingAirports() async* {
    var airportsResult = await getAirportsFromBookmarkUseCase.execute();
    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) if (airportsResult.right.isEmpty)
      yield AirportsEmptyState(airportsResult.right);
    else
      yield AirportsReadyState(airportsResult.right);
  }

  Stream<SavedState> handleDeletingAirports(AirportModel model) async* {
    var airportsResult = await deleteAirportFromBookmarkUseCase.execute(model);
    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) {
      yield AirportMessageState(
          state.airports, "Airport deleted from bookmark");
      if (airportsResult.right.isEmpty)
        yield AirportsEmptyState(airportsResult.right);
      else
        yield AirportsReadyState(airportsResult.right);
    }
  }

  Stream<SavedState> handleGettingWeather(AirportModel model) async* {
    yield SavedInitial(state.airports);
    var weatherResult = await getWeatherUseCase.getWeather(model.code);

    if (weatherResult.isLeft)
      yield AirportFailureState(
          state.airports, weatherResult.left.getMessage());

    if (weatherResult.isRight)
      yield WeatherLoaded(state.airports, weatherResult.right, model);
  }
}
