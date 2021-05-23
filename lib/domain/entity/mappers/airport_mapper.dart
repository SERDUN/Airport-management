import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';

class AirportMapper extends Mapper<AirportDTO, AirportModel> {
  @override
  AirportDTO mapToDto(AirportModel model) {
    throw UnimplementedError();
  }

  @override
  AirportModel mapToModel(AirportDTO dto) {
    return AirportModel(dto.nameAirport, dto.codeIataAirport);
  }
}