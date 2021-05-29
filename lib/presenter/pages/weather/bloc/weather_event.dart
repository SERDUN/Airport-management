part of 'weather_bloc.dart';

abstract class WeatherEvent {
  const WeatherEvent();
}

class AddAirportTooBookmarkEvent extends WeatherEvent {
  const AddAirportTooBookmarkEvent();
}


class FetchWeatherEvent implements WeatherEvent {
  FetchWeatherEvent();
}