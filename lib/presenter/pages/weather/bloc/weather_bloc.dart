import 'dart:async';

import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';

import 'package:Aevius/domain/usecases/bookmarks/AddAirportToBookmarkUseCase.dart';
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherModel weatherModel;
  final AirportModel airportModel;
  final AddAirportToBookmarkUseCase addAirportToBookmarkUseCase;
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(this.weatherModel, this.addAirportToBookmarkUseCase,
      this.airportModel, this.getWeatherUseCase)
      : super(WeatherInitial(weatherModel, airportModel));

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is AddAirportTooBookmarkEvent)
      yield* handleAddingToBookmark(airportModel);
    if (event is FetchWeatherEvent)
      yield* handleGettingWeather();
  }

  Stream<WeatherState> handleGettingWeather() async* {
    var weatherResult = await getWeatherUseCase.getWeather(airportModel.code);

    if (weatherResult.isLeft)
      yield WeatherFailureState(state.weatherModel, state.airportModel,
          weatherResult.left.getMessage());

    if (weatherResult.isRight)
      yield WeatherInitial(state.weatherModel, state.airportModel);
  }

  Stream<WeatherState> handleAddingToBookmark(
      AirportModel airportModel) async* {
    yield WeatherProgress(weatherModel, airportModel);
    var airportsResult =
        await addAirportToBookmarkUseCase.execute(airportModel);

    if (airportsResult.isLeft)
      yield WeatherFailureState(
          state.weatherModel, airportModel, airportsResult.left.getMessage());

    if (airportsResult.isRight)
      yield AirportWasAddedToBookmark(state.weatherModel, airportModel);
  }
}
