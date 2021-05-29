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
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCase.dart';

import 'AddAirportToBookmarkUseCase.dart';
import 'DeleteAirportFromBookmarkUseCase.dart';
import '../airport/GetNearbyAirportsUseCase.dart';

class DeleteAirportFromBookmarkUseCaseImp extends
DeleteAirportFromBookmarkUseCase {
  final BaseRepository baseRepository;
  final LocationRepository locationRepository;
  final Mapper<AirportDTO, AirportModel> mapper;

  DeleteAirportFromBookmarkUseCaseImp(
      this.baseRepository, this.locationRepository, this.mapper);

  @override
  Future<Either<Failure, List<AirportModel>>> invoke(AirportModel airport)
  async {
    AirportDTO dto = mapper.mapToDto(airport);
    var result = await baseRepository.deleteAirportFromBookmark(dto);
    if (result.isLeft) return Left(ErrorMessage(result.left.getMessage()));
    var model = result.right.map((e) => mapper.mapToModel(e)).toList();
    return Future.value(Right(model));
  }
}
