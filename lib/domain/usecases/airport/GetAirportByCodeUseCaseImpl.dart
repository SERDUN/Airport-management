import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';

import 'package:Aevius/domain/entity/models/error/either.dart';

import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';

import 'GetAirportByCodeUseCase.dart';
import 'GetNearbyAirportsUseCase.dart';

class GetAirportByCodeUseCaseImpl extends GetAirportByCodeUseCase {
  final BaseRepository baseRepository;
  final Mapper<AirportDetailsDTO, AirportModel> mapper;

  GetAirportByCodeUseCaseImpl(this.baseRepository, this.mapper);

  @override
  Future<Either<Failure, AirportModel>> invoke(String code) async {
    var airportsResult = await baseRepository.getAirportByCode(code);
    if (airportsResult.isLeft)
      return Left(ErrorMessage(airportsResult.left.getMessage()));

    var airport = mapper.mapToModel(airportsResult.right);
    return Future.value(Right(airport));
  }
}
