import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';

abstract class DeleteAirportFromBookmarkUseCase {
  Future<Either<Failure, List<AirportModel>>> invoke(AirportModel airport);
}
