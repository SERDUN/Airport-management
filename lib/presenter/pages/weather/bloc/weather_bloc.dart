import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';

import 'package:Aevius/domain/usecases/bookmarks/AddAirportToBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/bookmarks/DeleteAirportFromBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherModel weatherModel;
  final AirportModel airportModel;
  final AddAirportToBookmarkUseCase addAirportToBookmarkUseCase;
  final DeleteAirportFromBookmarkUseCase deleteAirportToBookmarkUseCase;

  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(
      this.weatherModel,
      this.addAirportToBookmarkUseCase,
      this.airportModel,
      this.getWeatherUseCase,
      this.deleteAirportToBookmarkUseCase)
      : super(WeatherInitial(weatherModel, airportModel));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is AddAirportTooBookmarkEvent)
      yield* handleAddingToBookmark(airportModel);
    if (event is FetchWeatherEvent) yield* handleGettingWeather();
  }

  Stream<WeatherState> handleGettingWeather() async* {
    var weatherResult = await getWeatherUseCase.invoke(airportModel.code);

    if (weatherResult.isLeft)
      yield WeatherFailureState(state.weatherModel, state.airportModel,
          weatherResult.left.getMessage());

    if (weatherResult.isRight)
      yield WeatherInitial(state.weatherModel, state.airportModel);
  }

  Stream<WeatherState> handleAddingToBookmark(
      AirportModel airportModel) async* {
    yield WeatherProgress(weatherModel, airportModel);

    if (airportModel.isInBookmark) {
      var airportsResult =
          await deleteAirportToBookmarkUseCase.invoke(airportModel);

      if (airportsResult.isRight) {
        airportModel.isInBookmark = false;
        yield AirportWasDeletedFromBookmark(state.weatherModel, airportModel);
      }
    } else {
      var airportsResult =
          await addAirportToBookmarkUseCase.invoke(airportModel);

      if (airportsResult.isLeft)
        yield WeatherFailureState(
            state.weatherModel, airportModel, airportsResult.left.getMessage());

      if (airportsResult.isRight) {
        airportModel.isInBookmark = true;
        yield AirportWasAddedToBookmark(state.weatherModel, airportModel);
      }
    }
  }
}
