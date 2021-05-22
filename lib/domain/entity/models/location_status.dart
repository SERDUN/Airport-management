
import 'location_model.dart';

enum LocationPermissionType {
  allow,
  not_allow,
  not_allow_forever,
}

class LocationStatus {
  LocationPermissionType type;
  LocationModel location;
}
