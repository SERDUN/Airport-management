import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:dio/dio.dart';

class BaseRepositoryImpl extends BaseRepository {
  final String aviationKey;
  RestClient _restClientAirPorts =
      RestClient("http://aviation-edge.com/v2/public");

  BaseRepositoryImpl(this.aviationKey);

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
  Future<Either<Failure, WeatherDto>> getWeatherByCode(String code) {
    // TODO: implement getWeatherByCode
    throw UnimplementedError();
  }
}
