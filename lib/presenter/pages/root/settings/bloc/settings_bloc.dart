import 'dart:async';

import 'package:Aevius/domain/usecases/settings/GetRadiusForAirportsUseCase.dart';
import 'package:Aevius/domain/usecases/settings/UpdateRadiusForAirportsUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
 final UpdateRadiusForAirportsUseCase updateRadiusForAirportsUseCase;
 final GetRadiusForAirportsUseCase getRadiusForAirportsUseCase;
  SettingsBloc(this.updateRadiusForAirportsUseCase, this.getRadiusForAirportsUseCase) : super(SettingsInitial(100));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
   if (event is GetCurrentRadiusEvent) yield* handleGettingCurrentRadius();
   if (event is UpdateCurrentRadiusEvent) yield* updateCurrentRadius(event.radius);  }



 Stream<SettingsState> handleGettingCurrentRadius() async* {
  var airportsResult = await getRadiusForAirportsUseCase.invoke();
  if (airportsResult.isLeft)
   yield AirportFailureState(
       state.currentRadius, airportsResult.left.getMessage());
  if (airportsResult.isRight) yield SettingsInitial(airportsResult.right);
 }

 Stream<SettingsState> updateCurrentRadius(int radius) async* {
  var airportsResult = await updateRadiusForAirportsUseCase.invoke(radius);
  if (airportsResult.isLeft)
   yield AirportFailureState(
       state.currentRadius, airportsResult.left.getMessage());
  if (airportsResult.isRight) yield SettingsInitial(airportsResult.right);
 }

}
