
import 'package:Aevius/domain/entity/models/error/either.dart';
import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/repository/settings_repository.dart';

import 'UpdateRadiusForAirportsUseCase.dart';

class UpdateRadiusForAirportsUseCaseImpl
    extends UpdateRadiusForAirportsUseCase {
  final SettingRepository settingRepository;

  UpdateRadiusForAirportsUseCaseImpl(this.settingRepository);

  @override
  Future<Either<Failure, int>> invoke(int radius) {
    return settingRepository.updateRadiusForGetNearbyAirport(radius);
  }
}
