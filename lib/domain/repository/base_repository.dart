import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<AirportDTO>>> getNearbyAirports(
      double lat, double lng, int radius);

  Future<Either<Failure, AirportDetailsDTO>> getAirportByCode(String code);

  Future<Either<Failure, List<AirportDTO>>> deleteAirportFromBookmark(
      AirportDTO airportDTO);

  Future<Either<Failure, AirportDTO>> addAirportToBookmark(
      AirportDTO airportDTO);

  Future<Either<Failure, List<AirportDTO>>> getAirportsFromBookmark();

  Future<Either<Failure, bool>> isAirportInBookmark(String code);

  Future<Either<Failure, WeatherDto>> getWeatherByCode(String code);
}
