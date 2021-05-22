import 'dart:async';

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
      : super(AirportsInitial());

  @override
  Stream<AirportsState> mapEventToState(
    AirportsEvent event,
  ) async* {
    if (event is LoadNearbyAirports) {
      var location=await locationRepository.getCurrentLocation();
      var airports=baseRepository.getNearbyAirports(location.right.lat,
          location.right.lng);

      print("sdsd");
    }
  }
}
