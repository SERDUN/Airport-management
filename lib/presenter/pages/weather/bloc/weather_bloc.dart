import 'dart:async';

import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/usecases/AddAirportToBookmarkUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherModel weatherModel;
  final AddAirportToBookmarkUseCase addAirportToBookmarkUseCase;
  WeatherBloc(this.weatherModel, this.addAirportToBookmarkUseCase) : super(WeatherInitial(weatherModel));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
