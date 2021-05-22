import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, List<AirportDTO>>> getNearbyAirports(
      double lat, double lng);

  Future<Either<Failure, WeatherDto>> getWeatherByCode(String code);
}
