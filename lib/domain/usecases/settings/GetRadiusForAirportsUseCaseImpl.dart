import 'dart:ffi';

import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';

import 'package:Aevius/domain/entity/models/error/either.dart';

import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/repository/settings_repository.dart';

import 'GetRadiusForAirportsUseCase.dart';
import 'UpdateRadiusForAirportsUseCase.dart';

class GetRadiusForAirportsUseCaseImpl
    extends GetRadiusForAirportsUseCase {
  final SettingRepository settingRepository;

  GetRadiusForAirportsUseCaseImpl(this.settingRepository);

  @override
  Future<Either<Failure, int>> invoke() {
    return settingRepository.getRadiusForGetNearbyAirport();
  }
}
