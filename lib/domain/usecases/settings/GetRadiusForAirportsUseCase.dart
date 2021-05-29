import 'dart:ffi';

import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';

abstract class GetRadiusForAirportsUseCase{
  Future<Either<Failure, int>> invoke();

}