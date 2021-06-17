import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';

import 'package:Aevius/domain/entity/models/error/either.dart';

import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/repository/settings_repository.dart';

import 'GetAirportByCodeUseCase.dart';
import 'GetNearbyAirportsUseCase.dart';
import 'IsAirportInBookmarkUseCase.dart';

class IsAirportInBookmarkUseCaseImpl extends IsAirportInBookmarkUseCase {
  final BaseRepository baseRepository;

  IsAirportInBookmarkUseCaseImpl(this.baseRepository);

  @override
  Future<bool> invoke(String code) async {
    var result = await baseRepository.getAirportsFromBookmark();
    if (result.isLeft) return Future.value(false);
    if (result.isRight) return Future.value(!result.right.isEmpty);
  }
//
// @override
// Future<Either<Failure, List<AirportModel>>> invoke() async {
//   var locationResult = await locationRepository.getCurrentLocation();
//   if (locationResult.isLeft) {
//     var error = ErrorMessage(locationResult.left.getMessage());
//     error.failureType = locationResult.left.failureType;
//     return Left(error);
//   }
//
//   var radiusResult = await settingRepository.getRadiusForGetNearbyAirport();
//   if (radiusResult.isLeft)
//     return Left(ErrorMessage(radiusResult.left.getMessage()));
//
//   var airportsResult = await baseRepository.getNearbyAirports(
//       locationResult.right.lat, locationResult.right.lng, radiusResult.right);
//   if (airportsResult.isLeft)
//     return Left(ErrorMessage(airportsResult.left.getMessage()));
//
//   var airports =
//       airportsResult.right.map((e) => mapper.mapToModel(e)).toList();
//
//   airports.forEach((element) async {
//     var isInBookmarkResult =
//         await baseRepository.isAirportInBookmark(element.code);
//     if (isInBookmarkResult.isRight)
//       element.isInBookmark = isInBookmarkResult.right;
//   });
//
//   return Future.value(Right(airports));
// }
}
