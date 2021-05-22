import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/location_model.dart';
import 'package:Aevius/domain/entity/models/location_status.dart';

abstract class LocationRepository {
  Future<LocationPermissionType> checkLocationPermission();

  Future<LocationPermissionType> requestLocationPermission();

  Future<LocationPermissionType> openSettingsLocationPermission();


  Future<Either<Failure, LocationModel>> getCurrentLocation();


  Future<Either<Failure, LocationModel>> getLastLocation();




}
