import 'package:Aevius/domain/entity/models/error/default_error.dart';
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/location_model.dart';
import 'package:Aevius/domain/entity/models/location_status.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepositoryImpl implements LocationRepository {
  final SharedPreferences _sharedPreferences;

  LocationModel preparedLocation;

  LocationRepositoryImpl(this._sharedPreferences);

  LocationAccuracy desiredAccuracy = LocationAccuracy.low;

  @override
  LocationModel getPreparedDefaultLocation() {
    return preparedLocation;
  }

  @override
  Future<LocationModel> prepareDefaultLocation() async {
    preparedLocation = LocationModel(lat: 0, lng: 0);

    try {
      var lastPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: desiredAccuracy, timeLimit: Duration(seconds: 20));
      preparedLocation = LocationModel(
          lat: lastPosition.latitude, lng: lastPosition.longitude);
      return Future.value(preparedLocation);
    } catch (e) {
      return Future.value(preparedLocation);
    }
  }

  @override
  Future<LocationPermissionType> checkLocationPermission() async {
    var result = await Geolocator.checkPermission();

    switch (result) {
      case LocationPermission.denied:
        return Future.value(LocationPermissionType.not_allow);
        break;
      case LocationPermission.deniedForever:
        return Future.value(LocationPermissionType.not_allow_forever);
        break;
      case LocationPermission.whileInUse:
        return Future.value(LocationPermissionType.allow);
        break;
      case LocationPermission.always:
        return Future.value(LocationPermissionType.allow);
        break;
      default:
        return Future.value(LocationPermissionType.not_allow_forever);
    }
  }

  @override
  Future<LocationPermissionType> requestLocationPermission() async {
    var result = await Geolocator.requestPermission();

    switch (result) {
      case LocationPermission.denied:
        return Future.value(LocationPermissionType.not_allow);
        break;
      case LocationPermission.deniedForever:
        return Future.value(LocationPermissionType.not_allow_forever);
        break;
      case LocationPermission.whileInUse:
        return Future.value(LocationPermissionType.allow);
        break;
      case LocationPermission.always:
        return Future.value(LocationPermissionType.allow);
        break;
      default:
        return Future.value(LocationPermissionType.not_allow_forever);
    }
  }

  @override
  Future<Either<Failure, LocationModel>> getLastLocation() async {
    try {
      var lastPosition = await Geolocator.getLastKnownPosition();

      return Future.value(Right(LocationModel(
          lat: lastPosition.latitude, lng: lastPosition.longitude)));
    } catch (e) {
      Failure message = ErrorMessage(e.toString());
      return Future.value(Left(message));
    }
  }

  @override
  Future<Either<Failure, LocationModel>> getCurrentLocation() async {
    try {
      var lastPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: desiredAccuracy, timeLimit: Duration(seconds: 5));
      preparedLocation = LocationModel(
          lat: lastPosition.latitude, lng: lastPosition.longitude);
      return Future.value(Right(LocationModel(
          lat: lastPosition.latitude, lng: lastPosition.longitude)));
    } catch (e) {
      Failure message = ErrorMessage(e.toString());
      return Future.value(Left(message));
    }
  }



  @override
  Future<LocationPermissionType> openSettingsLocationPermission() async {
    var result = await Geolocator.openLocationSettings();
    return checkLocationPermission();
  }
}
