import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/usecases/AddAirportToBookmarkUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherModel weatherModel;
  final AirportModel airportModel;
  final AddAirportToBookmarkUseCase addAirportToBookmarkUseCase;

  WeatherBloc(
      this.weatherModel, this.addAirportToBookmarkUseCase, this.airportModel)
      : super(WeatherInitial(weatherModel,airportModel));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is AddAirportTooBookmarkEvent)
      yield* handleAddingToBookmark(airportModel);
  }

  Stream<WeatherState> handleAddingToBookmark(
      AirportModel airportModel) async* {
    yield WeatherProgress(weatherModel,airportModel);
    var airportsResult =
        await addAirportToBookmarkUseCase.execute(airportModel);

    if (airportsResult.isLeft)
      yield WeatherFailureState(
          state.weatherModel, airportsResult.left.getMessage(),airportModel);

    if (airportsResult.isRight)
      yield AirportWasAddedToBookmark(state.weatherModel,airportModel);
  }
}
