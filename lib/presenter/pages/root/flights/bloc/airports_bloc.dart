import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/cloud_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/GetNearbyAirportsUseCase.dart';
import 'package:Aevius/domain/usecases/GetWeatherUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'airports_event.dart';

part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  GetNearbyAirportsUseCase getNearbyAirportsUseCase;
  GetWeatherUseCase getWeatherUseCase;

  AirportsBloc(this.getNearbyAirportsUseCase, this.getWeatherUseCase)
      : super(AirportsInitial([]));

  @override
  Stream<AirportsState> mapEventToState(
    AirportsEvent event,
  ) async* {
    if (event is LoadNearbyAirports) handleGettingAirports();
    if (event is LoadWeatherForAirport) handleGettingWeather(event.airport);

  }

  Stream<AirportsState> handleGettingAirports() async* {
    var airportsResult = await getNearbyAirportsUseCase.getNearbyAirports();

    if (airportsResult.isLeft)
      yield AirportFailureState(state.airports, airportsResult.left.getMessage());

    if (airportsResult.isLeft) yield AirportsLoaded(airportsResult.right);
  }

  Stream<AirportsState> handleGettingWeather(AirportModel airport) async* {
    var weatherResult = await getWeatherUseCase.getWeather(airport.code);

    if (weatherResult.isLeft)
      yield AirportFailureState(state.airports, weatherResult.left.getMessage());

    if (weatherResult.isLeft)
      yield WeatherLoaded(state.airports, weatherResult.right);
  }
}
