import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/error/default_error.dart';

import 'package:Aevius/domain/entity/models/error/either.dart';

import 'package:Aevius/domain/entity/models/error/failures.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';
import 'package:Aevius/domain/repository/base_repository.dart';
import 'package:Aevius/domain/repository/location_repository.dart';
import 'package:Aevius/domain/usecases/weather/GetWeatherUseCase.dart';
import 'package:Aevius/domain/utils/utils.dart';

import 'AddAirportToBookmarkUseCase.dart';
import '../airport/GetNearbyAirportsUseCase.dart';

class AddAirportToBookmarkUseCaseImp extends AddAirportToBookmarkUseCase {
  final BaseRepository baseRepository;
  final LocationRepository locationRepository;
  final Mapper<AirportDTO, AirportModel> mapper;
  final Mapper<AirportDetailsDTO, AirportModel> mapperDetails;

  AddAirportToBookmarkUseCaseImp(this.baseRepository, this.locationRepository,
      this.mapper, this.mapperDetails);

  @override
  Future<Either<Failure, AirportModel>> invoke(AirportModel airport) async {
    var savingAirport = airport;

    if (isNullOrEmpty(airport.name)) {
      var airportDetailsResult =
          await baseRepository.getAirportByCode(airport.code);
      if (airportDetailsResult.isLeft)
        return Left(ErrorMessage(airportDetailsResult.left.getMessage()));
      var model = mapperDetails.mapToModel(airportDetailsResult.right);
      savingAirport = model;
    }

    AirportDTO dto = mapper.mapToDto(savingAirport);
    var result = await baseRepository.addAirportToBookmark(dto);
    if (result.isLeft) return Left(ErrorMessage(result.left.getMessage()));

    var model = mapper.mapToModel(result.right);
    return Future.value(Right(model));
  }
}
