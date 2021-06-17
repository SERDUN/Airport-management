import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/cloud_model.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/airport/IsAirportInBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/bookmarks/AddAirportToBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/bookmarks/DeleteAirportFromBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/airport/GetNearbyAirportsUseCase.dart';
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'airports_event.dart';

part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  final GetNearbyAirportsUseCase getNearbyAirportsUseCase;
  final GetWeatherUseCase getWeatherUseCase;
  final AddAirportToBookmarkUseCase addAirportToBookmarkUseCase;
  final DeleteAirportFromBookmarkUseCase deleteAirportToBookmarkUseCase;
  final IsAirportInBookmarkUseCase isAirportInBookmarkUseCase;

  AirportsBloc(this.getNearbyAirportsUseCase, this.getWeatherUseCase,
      this.deleteAirportToBookmarkUseCase, this.isAirportInBookmarkUseCase,
      {this.addAirportToBookmarkUseCase})
      : super(AirportsInitial([]));

  @override
  Stream<AirportsState> mapEventToState(AirportsEvent event,) async* {
    if (event is LoadNearbyAirports) yield* handleGettingAirports();
    if (event is LoadWeatherForAirport)
      yield* handleGettingWeather(event.airport);
    if (event is FindWeatherByCodeEvent)
      yield* handleGettingWeather(AirportModel("", event.code));
    if (event is AddAirportTooBookmarkEvent)
      yield* handleAddingToBookmark(event.airport);
  }

  Stream<AirportsState> handleGettingAirports() async* {
    if (state.airports.isEmpty) yield AirportsInitial(state.airports);
    var airportsResult = await getNearbyAirportsUseCase.invoke();

    if (airportsResult.isLeft) if (airportsResult.left.failureType ==
        FailureType.DEFAULT)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());
    else
      yield LocationNotDetectedFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) yield AirportsLoaded(airportsResult.right);
  }

  Stream<AirportsState> handleGettingWeather(AirportModel model) async* {
    yield AirportsInitial(state.airports);
    var weatherResult = await getWeatherUseCase.invoke(model.code);

    if (weatherResult.isLeft)
      yield AirportFailureState(
          state.airports, weatherResult.left.getMessage());

    if (weatherResult.isRight) {
      model.isInBookmark = await isAirportInBookmarkUseCase.invoke(model.code);
      yield WeatherLoaded(state.airports, weatherResult.right, model);
    }
  }

  Stream<AirportsState> handleAddingToBookmark(
      AirportModel airportModel) async* {
    yield AirportsInitial(state.airports);

    if (airportModel.isInBookmark) {
      var airportsResult =
      await deleteAirportToBookmarkUseCase.invoke(airportModel);

      if (airportsResult.isRight) {
        airportModel.isInBookmark = false;
        yield AirportWasDeletedFromBookmark(state.airports);
      }
    } else {
      var airportsResult =
      await addAirportToBookmarkUseCase.invoke(airportModel);

      if (airportsResult.isLeft)
        yield AirportFailureState(
            state.airports, airportsResult.left.getMessage());

      if (airportsResult.isRight) {
        airportModel.isInBookmark = true;
        yield AirportWasAddedToBookmark(state.airports);
      }
    }
  }
}
