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
