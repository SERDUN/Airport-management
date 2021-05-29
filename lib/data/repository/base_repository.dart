import 'package:Aevius/data/source/local_storage.dart';
import 'package:Aevius/data/source/rest_client.dart';
import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/airport_error_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class BaseRepositoryImpl extends BaseRepository {
  final RestClient restClientAirPorts;
  final RestClient restClientWeather;
  final RestClient airportDetailsClient;
  final LocalStorage localStorage;

  BaseRepositoryImpl(
    this.restClientAirPorts,
    this.restClientWeather,
    this.localStorage,
    this.airportDetailsClient,
  );

  @override
  Future<Either<Failure, List<AirportDTO>>> getNearbyAirports(
      double lat, double lng,int radius) async {
    Response response = await restClientAirPorts.get(
      "/nearby?lat=$lat&lng=$lng&limit=10&distance=$radius",
    );
    if (response.statusCode < 300) {
      try {
        return Right(airportToList(response.data));
      } catch (e) {
        try {
          var failure = AirportErrorDTO.fromJson(response.data);
          return Future.value(Left(ErrorMessage(failure.error)));
        } catch (e) {
          return Future.value(Left(ErrorMessage(e.toString())));
        }
      }
    } else {
      var serverFailure = ServerFailure(
          response.statusCode, response.data, response.statusMessage)
        ..parseError();
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, WeatherDto>> getWeatherByCode(String code) async {
    Response response =
        await restClientWeather.get("/metar/$code?airport=true&format=json");
    if (response.statusCode < 300) {
      if (response.data == "") {
        return Future.value(
            Left(ErrorMessage("There is no data on this airport")));
      } else
        return Right(WeatherDto.fromJson(response.data));
    } else {
      var serverFailure = ServerFailure(
          response.statusCode, response.data, response.statusMessage)
        ..parseError();
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, AirportDTO>> addAirportToBookmark(
      AirportDTO airportDTO) async {
    try {
      var result = await localStorage.addAirportToBookmark(airportDTO);
      if (result) {
        return Future.value(Right(airportDTO));
      }
      {
        return Future.value(Left(ErrorMessage("Airport did not save")));
      }
    } catch (e) {
      return Future.value(
          Left(ErrorMessage("Airport did not save because $e")));
    }
  }

  @override
  Future<Either<Failure, List<AirportDTO>>> getAirportsFromBookmark() async {
    try {
      return Future.value(Right(localStorage.getSavedAirports()));
    } catch (e) {
      return Future.value(
          Left(ErrorMessage("Airport did not get  because $e")));
    }
  }

  @override
  Future<Either<Failure, List<AirportDTO>>> deleteAirportFromBookmark(
      AirportDTO airportDTO) async {
    try {
      var result = await localStorage.deleteAirportFromBookmark(airportDTO);
      return Future.value(Right(result));
    } catch (e) {
      return Future.value(
          Left(ErrorMessage("Airport did not delete because $e")));
    }
  }

  @override
  Future<Either<Failure, AirportDetailsDTO>> getAirportByCode(String code) async{
    Response response = await airportDetailsClient.get("/single?iata=$code",);
    if (response.statusCode < 300) {
      try {
        return Right(AirportDetailsDTO.fromJson(response.data));
      } catch (e) {
        try {
          var failure = AirportErrorDTO.fromJson(response.data);
          return Future.value(Left(ErrorMessage(failure.error)));
        } catch (e) {
          return Future.value(Left(ErrorMessage(e.toString())));
        }
      }
    } else {
      var serverFailure = ServerFailure(
          response.statusCode, response.data, response.statusMessage)
        ..parseError();
      return Left(serverFailure);
    }
  }
}
