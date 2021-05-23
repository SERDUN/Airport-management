import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'airports_event.dart';

part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  final BaseRepository baseRepository;
  final LocationRepository locationRepository;

  AirportsBloc(this.baseRepository, this.locationRepository)
      : super(AirportsInitial([]));

  @override
  Stream<AirportsState> mapEventToState(
    AirportsEvent event,
  ) async* {
    //add map and useCase
    //todo add handling error
    if (event is LoadNearbyAirports) {
      var location = await locationRepository.getCurrentLocation();
      var airports = await baseRepository.getNearbyAirports(
          location.right.lat, location.right.lng);
      var list = airports.right
          .map((e) => AirportModel(e.nameAirport, e.codeIataAirport));
      yield AirportsLoaded(list.toList());
    }

    if (event is LoadWeatherForAirport) {
      var weather = await baseRepository.getWeatherByCode(event.airport.code);
      yield WeatherLoaded(
          this.state.airports, WeatherModel(event.airport.name.toString()));
    }
  }
}
