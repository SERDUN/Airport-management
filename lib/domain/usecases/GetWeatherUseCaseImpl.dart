import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';

import 'package:Aevius/domain/entity/models/error/either.dart';

import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/GetWeatherUseCase.dart';

import 'GetNearbyAirportsUseCase.dart';

class GeWeatherUseCaseImpl extends GetWeatherUseCase {
  final BaseRepository baseRepository;
  final LocationRepository locationRepository;
  final Mapper<WeatherDto, WeatherModel> mapper;

  GeWeatherUseCaseImpl(
      this.baseRepository, this.locationRepository, this.mapper);

  @override
  Future<Either<Failure, WeatherModel>> getWeather(String airportCode) async {
    var weatherResult = await baseRepository.getWeatherByCode(airportCode);
    if (weatherResult.isLeft)
      return Left(ErrorMessage(weatherResult.left.getMessage()));

    var weatherModel = mapper.mapToModel(weatherResult.right);
    return Future.value(Right(weatherModel));
  }
}
