part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  final WeatherModel weatherModel;

  const WeatherState(this.weatherModel);
}

class WeatherInitial extends WeatherState {
  WeatherInitial(WeatherModel weatherModel) : super(weatherModel);
  @override
  List<Object> get props => [];
}

class WeatherProgress extends WeatherState {
  WeatherProgress(WeatherModel weatherModel) : super(weatherModel);
  @override
  List<Object> get props => [];
}

class AirportWasAddedToBookmark extends WeatherState {
  AirportWasAddedToBookmark(WeatherModel weatherModel) : super(weatherModel);

  @override
  List<Object> get props => [];
}

class WeatherFailureState extends WeatherState {
  final String message;

  WeatherFailureState(WeatherModel weather, this.message)
      : super(weather);

  @override
  List<Object> get props => [weatherModel, DateTime.now().microsecondsSinceEpoch,message];
}
