import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/location_model.dart';
import 'package:Aevius/domain/entity/models/location_status.dart';

abstract class SettingRepository {
  Future<Either<Failure, int>> updateRadiusForGetNearbyAirport(int radius);
  Future<Either<Failure, int>> getRadiusForGetNearbyAirport();




}
