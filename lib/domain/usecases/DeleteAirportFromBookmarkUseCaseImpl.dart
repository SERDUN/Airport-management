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

import 'AddAirportToBookmarkUseCase.dart';
import 'GetNearbyAirportsUseCase.dart';

class AddAirportToBookmarkUseCaseImp extends AddAirportToBookmarkUseCase {
  final BaseRepository baseRepository;
  final LocationRepository locationRepository;
  final Mapper<AirportDTO, AirportModel> mapper;

  AddAirportToBookmarkUseCaseImp(
      this.baseRepository, this.locationRepository, this.mapper);

  @override
  Future<Either<Failure, AirportModel>> execute(AirportModel airport) async {
    AirportDTO dto = mapper.mapToDto(airport);
    var result = await baseRepository.addAirportToBookmark(dto);
    if (result.isLeft) return Left(ErrorMessage(result.left.getMessage()));

    var model = mapper.mapToModel(result.right);
    return Future.value(Right(model));
  }
}
