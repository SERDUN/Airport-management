import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';

import 'package:Aevius/domain/entity/models/error/either.dart';

import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/repository/settings_repository.dart';

import 'GetNearbyAirportsUseCase.dart';

class GetNearbyAirportsUseCaseImpl extends GetNearbyAirportsUseCase {
  final BaseRepository baseRepository;
  final LocationRepository locationRepository;
  final SettingRepository settingRepository;
  final Mapper<AirportDTO, AirportModel> mapper;

  GetNearbyAirportsUseCaseImpl(this.baseRepository, this.locationRepository,
      this.mapper, this.settingRepository);

  @override
  Future<Either<Failure, List<AirportModel>>> invoke() async {
    var locationResult = await locationRepository.getCurrentLocation();
    if (locationResult.isLeft)
      return Left(ErrorMessage(locationResult.left.getMessage()));

    var radiusResult = await settingRepository.getRadiusForGetNearbyAirport();
    if (radiusResult.isLeft)
      return Left(ErrorMessage(radiusResult.left.getMessage()));

    var airportsResult = await baseRepository.getNearbyAirports(
        locationResult.right.lat, locationResult.right.lng, radiusResult.right);
    if (airportsResult.isLeft)
      return Left(ErrorMessage(airportsResult.left.getMessage()));

    var airports =
        airportsResult.right.map((e) => mapper.mapToModel(e)).toList();

    return Future.value(Right(airports));
  }
}
