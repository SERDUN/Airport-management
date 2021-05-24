import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/cloud_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/AddAirportToBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/DeleteAirportFromBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/GetNearbyAirportsUseCase.dart';
import 'package:Aevius/domain/usecases/GetWeatherUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'airports_event.dart';

part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  final GetNearbyAirportsUseCase getNearbyAirportsUseCase;
  final GetWeatherUseCase getWeatherUseCase;
  final AddAirportToBookmarkUseCase addAirportToBookmarkUseCase;

  AirportsBloc(this.getNearbyAirportsUseCase, this.getWeatherUseCase,
      {this.addAirportToBookmarkUseCase})
      : super(AirportsInitial([]));

  @override
  Stream<AirportsState> mapEventToState(
    AirportsEvent event,
  ) async* {
    if (event is LoadNearbyAirports) yield* handleGettingAirports();
    if (event is LoadWeatherForAirport)
      yield* handleGettingWeather(event.airport);
    if (event is FindWeatherByCodeEvent)
      yield* handleGettingWeather(AirportModel("Not defined", event.code));
    if (event is AddAirportTooBookmarkEvent)
      yield* handleAddingToBookmark(event.airport);
  }

  Stream<AirportsState> handleGettingAirports() async* {
    var airportsResult = await getNearbyAirportsUseCase.getNearbyAirports();

    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) yield AirportsLoaded(airportsResult.right);
  }

  Stream<AirportsState> handleGettingWeather(AirportModel model) async* {
    yield AirportsInitial(state.airports);
    var weatherResult = await getWeatherUseCase.getWeather(model.code);

    if (weatherResult.isLeft)
      yield AirportFailureState(
          state.airports, weatherResult.left.getMessage());

    if (weatherResult.isRight)
      yield WeatherLoaded(state.airports, weatherResult.right, model);
  }

  Stream<AirportsState> handleAddingToBookmark(
      AirportModel airportModel) async* {
    yield AirportsInitial(state.airports);
    var airportsResult =
        await addAirportToBookmarkUseCase.execute(airportModel);

    if (airportsResult.isLeft)
      yield AirportFailureState(
          state.airports, airportsResult.left.getMessage());

    if (airportsResult.isRight) yield AirportWasAddedToBookmark(state.airports);
  }
}
