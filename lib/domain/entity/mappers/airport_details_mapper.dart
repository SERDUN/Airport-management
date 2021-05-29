import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_details/airport_details_dto.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';

class AirportDetailsMapper extends Mapper<AirportDetailsDTO, AirportModel> {

  @override
  AirportModel mapToModel(AirportDetailsDTO dto) {
    return AirportModel(dto.airport.name, dto.airport.iata,
        distance: null, timeZone: null, country: dto.airport.country.name);
  }

  @override
  AirportDetailsDTO mapToDto(AirportModel model) {
    throw UnimplementedError();
  }

}
