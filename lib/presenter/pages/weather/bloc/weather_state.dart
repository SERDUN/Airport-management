part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  final WeatherModel weatherModel;
  final AirportModel airportModel;

  const WeatherState(this.weatherModel, this.airportModel);
}

class WeatherInitial extends WeatherState {
  WeatherInitial(WeatherModel weatherModel,AirportModel airportModel) : super
      (weatherModel,airportModel);
  @override
  List<Object> get props => [DateTime.now().microsecondsSinceEpoch];
}

class WeatherProgress extends WeatherState {
  WeatherProgress(WeatherModel weatherModel,AirportModel airportModel) :
        super(weatherModel,airportModel);
  @override
  List<Object> get props => [];
}

class AirportWasAddedToBookmark extends WeatherState {
  AirportWasAddedToBookmark(WeatherModel weatherModel,AirportModel
  airportModel) : super(weatherModel,airportModel);

  @override
  List<Object> get props => [DateTime.now().microsecondsSinceEpoch];
}

class WeatherFailureState extends WeatherState {
  final String message;

  WeatherFailureState(WeatherModel weather, AirportModel airportModel,this.message,)
      : super(weather,airportModel);

  @override
  List<Object> get props => [weatherModel, DateTime.now().microsecondsSinceEpoch,message];
}

class UpdatingState extends WeatherState {

  UpdatingState(WeatherModel weather,AirportModel airportModel)
      : super(weather,airportModel);

  @override
  List<Object> get props => [weatherModel, DateTime.now().microsecondsSinceEpoch];
}
