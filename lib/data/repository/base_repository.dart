import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:dio/dio.dart';

class BaseRepositoryImpl extends BaseRepository {
  final String aviationKey;
  final String weatherKey;
  RestClient _restClientAirPorts =
      RestClient("http://aviation-edge.com/v2/public");
  RestClient _restClientWeather = RestClient("https://avwx.rest/api");

  BaseRepositoryImpl(this.aviationKey, this.weatherKey);

  @override
  Future<Either<Failure, List<AirportDTO>>> getNearbyAirports(
      double lat, double lng) async {
    Response response = await _restClientAirPorts.get(
        "/nearby?key=$aviationKey&lat=46.482952&lng=30.712481&distance=100");
    if (response.statusCode < 300) {
      return Right(airportToList(response.data));
    } else {
      var serverFailure = ServerFailure(
          response.statusCode, response.data, response.statusMessage)
        ..parseError();
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, WeatherDto>> getWeatherByCode(String code) async {
    _restClientWeather.dio.options.headers["Authorization"] = "BEARER  $weatherKey";

    Response response = await _restClientWeather.get("/metar/$code?airport=true&format=json");
    if (response.statusCode < 300) {
      return Right(WeatherDto.fromJson(response.data));
    } else {
      var serverFailure = ServerFailure(
          response.statusCode, response.data, response.statusMessage)
        ..parseError();
      return Left(serverFailure);
    }
  }
}
