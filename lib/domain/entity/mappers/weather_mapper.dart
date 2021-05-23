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
        lastFetch: dto.meta.stationsUpdated,
        altimeterValue: dto.altimeter.value.toString(),
        flightsRule: dto.flightRules,
        visibility: dto.visibility.value.toString(),
        windDirection: dto.windDirection.value.toString(),
        windSpeed: dto.windSpeed.value.toString(),
        tmp: dto.temperature.value.toString(),
        clouds: clouds);
  }
}
