import 'package:Aevius/domain/common/mapper_contract.dart';
import 'package:Aevius/domain/entity/dto/airoport_dto.dart';
import 'package:Aevius/domain/entity/dto/weather_dto.dart';
import 'package:Aevius/domain/entity/models/airport_model.dart';
import 'package:Aevius/domain/entity/models/cloud_model.dart';
import 'package:Aevius/domain/entity/models/weather_model.dart';

class WeatherMapper extends Mapper<WeatherDto, WeatherModel> {
  @override
  WeatherDto mapToDto(WeatherModel model) {
    // TODO: implement mapToDto
    throw UnimplementedError();
  }

  @override
  WeatherModel mapToModel(WeatherDto dto) {
    var clouds = dto.clouds
        .map((e) => CloudModel(e.type, e.altitude.toString(),
            e.modifier.toString(), e.direction.toString()))
        .toList();

    return WeatherModel(
        metaLastStationUpdate: dto.meta.stationsUpdated,
        altimeterValue: dto.altimeter.value.toString(),
        flightsRule: dto.flightRules,
        metaTimestamp: dto.meta.timestamp,
        altimeterRepr: dto.altimeter.repr,
        visibilitySpoken: dto.visibility.spoken,
        visibilityValue: dto.visibility.value.toString(),
        visibilityRepr: dto.visibility.repr.toString(),
        station: dto.station,
        timeDt: dto.time.dt,
        timeRept: dto.time.repr,
        raw: dto.raw,
        sanitized: dto.sanitized,
        dewpointRepr: dto.dewpoint.repr.toString(),
        dewpointValue: dto.dewpoint.value.toString(),
        remark: dto.remarks,
        windDirection: dto.windDirection.value.toString(),
        windSpeed: dto.windSpeed.value.toString(),
        tmp: dto.temperature.value.toString(),
        clouds: clouds);
  }
}
