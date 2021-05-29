import 'package:Aevius/data/source/local_storage.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/location_model.dart';
import 'package:Aevius/domain/entity/models/location_status.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/repository/settings_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepositoryImpl implements SettingRepository {
  final LocalStorage localStorage;

  SettingRepositoryImpl(this.localStorage);

  @override
  Future<Either<Failure, int>> getRadiusForGetNearbyAirport() {
    return Future.value(Right(localStorage.getSearchAirportRadius()));
  }

  @override
  Future<Either<Failure, int>> updateRadiusForGetNearbyAirport(
      int radius) async {
    var isUpdated = await localStorage.saveSearchAirportRadius(radius);
    return Future.value(
        isUpdated ? Right(radius) : Left(ErrorMessage("Not updated")));
  }
}
