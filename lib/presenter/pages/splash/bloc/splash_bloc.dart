import 'dart:async';

import 'package:Aevius/domain/entity/models/location_status.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  //todo add use case
  SplashBloc(this.locationRepository) : super(SplashInitial());
  final LocationRepository locationRepository;

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is CheckPermissionLocationEvent) {
      var result = await locationRepository.checkLocationPermission();
      switch (result) {
        case LocationPermissionType.allow:
          //init start location

          yield LocationAllow();
          break;
        case LocationPermissionType.not_allow:
          yield LocationDenny();
          break;
        case LocationPermissionType.not_allow_forever:
          yield LocationDennyForever();
          break;
      }
    }

    if (event is RequestPermissionLocationEvent) {
      var result = await locationRepository.requestLocationPermission();
      switch (result) {
        case LocationPermissionType.allow:
          yield LocationAllow();
          break;
        case LocationPermissionType.not_allow:
          yield LocationDenny();
          break;
        case LocationPermissionType.not_allow_forever:
          yield LocationDennyForever();
          break;
      }
    }

    if (event is OpenSettingsPermissionLocationEvent) {
      var result = await locationRepository.openSettingsLocationPermission();
      switch (result) {
        case LocationPermissionType.allow:
          //init start location
          yield LocationAllow();
          break;
        case LocationPermissionType.not_allow:
          yield LocationDenny();
          break;
        case LocationPermissionType.not_allow_forever:
          yield LocationDennyForever();
          break;
      }
    }
  }
}
