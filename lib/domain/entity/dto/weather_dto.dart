/// meta : {"timestamp":"2021-05-22T15:13:43.657553Z","stations_updated":"2021-04-23"}
/// altimeter : {"repr":"Q1013","value":1013,"spoken":"one zero one three"}
/// clouds : []
/// flight_rules : "VFR"
/// other : []
/// visibility : {"repr":"CAVOK","value":9999,"spoken":"ceiling and visibility ok"}
/// wind_direction : {"repr":"180","value":180,"spoken":"one eight zero"}
/// wind_gust : null
/// wind_speed : {"repr":"03","value":3,"spoken":"three"}
/// wx_codes : []
/// raw : "UKKK 221500Z 18003MPS 150V230 CAVOK 22/06 Q1013 R26/70D NOSIG"
/// sanitized : "UKKK 221500Z 18003MPS 150V230 CAVOK 22/06 Q1013 R26/70D NOSIG"
/// station : "UKKK"
/// time : {"repr":"221500Z","dt":"2021-05-22T15:00:00Z"}
/// remarks : "R26/70D NOSIG"
/// dewpoint : {"repr":"06","value":6,"spoken":"six"}
/// remarks_info : {"dewpoint_decimal":null,"temperature_decimal":null}
/// runway_visibility : []
/// temperature : {"repr":"22","value":22,"spoken":"two two"}
/// wind_variable_direction : [{"repr":"150","value":150,"spoken":"one five zero"},{"repr":"230","value":230,"spoken":"two three zero"}]
/// units : {"altimeter":"hPa","altitude":"ft","temperature":"C","visibility":"m","wind_speed":"m/s"}

class WeatherDto {
  Meta _meta;
  Altimeter _altimeter;
  String _flightRules;
  List<dynamic> _other;
  Visibility _visibility;
  Wind_direction _windDirection;
  dynamic _windGust;
  Wind_speed _windSpeed;
  List<dynamic> _wxCodes;
  String _raw;
  String _sanitized;
  String _station;
  Time _time;
  String _remarks;
  Dewpoint _dewpoint;
  Remarks_info _remarksInfo;
  List<dynamic> _runwayVisibility;
  Temperature _temperature;
  List<Wind_variable_direction> _windVariableDirection;
  Units _units;

  Meta get meta => _meta;
  Altimeter get altimeter => _altimeter;
  //List<dynamic> get clouds => _clouds;
  String get flightRules => _flightRules;
  List<dynamic> get other => _other;
  Visibility get visibility => _visibility;
  Wind_direction get windDirection => _windDirection;
  dynamic get windGust => _windGust;
  Wind_speed get windSpeed => _windSpeed;
  List<dynamic> get wxCodes => _wxCodes;
  String get raw => _raw;
  String get sanitized => _sanitized;
  String get station => _station;
  Time get time => _time;
  String get remarks => _remarks;
  Dewpoint get dewpoint => _dewpoint;
  Remarks_info get remarksInfo => _remarksInfo;
  List<dynamic> get runwayVisibility => _runwayVisibility;
  Temperature get temperature => _temperature;
  List<Wind_variable_direction> get windVariableDirection => _windVariableDirection;
  Units get units => _units;

  WeatherDto({
      Meta meta, 
      Altimeter altimeter, 
      List<dynamic> clouds, 
      String flightRules, 
      List<dynamic> other, 
      Visibility visibility, 
      Wind_direction windDirection, 
      dynamic windGust, 
      Wind_speed windSpeed, 
      List<dynamic> wxCodes, 
      String raw, 
      String sanitized, 
      String station, 
      Time time, 
      String remarks, 
      Dewpoint dewpoint, 
      Remarks_info remarksInfo, 
      List<dynamic> runwayVisibility, 
      Temperature temperature, 
      List<Wind_variable_direction> windVariableDirection, 
      Units units}){
    _meta = meta;
    _altimeter = altimeter;
   // _clouds = clouds;
    _flightRules = flightRules;
    _other = other;
    _visibility = visibility;
    _windDirection = windDirection;
    _windGust = windGust;
    _windSpeed = windSpeed;
    _wxCodes = wxCodes;
    _raw = raw;
    _sanitized = sanitized;
    _station = station;
    _time = time;
    _remarks = remarks;
    _dewpoint = dewpoint;
    _remarksInfo = remarksInfo;
    _runwayVisibility = runwayVisibility;
    _temperature = temperature;
    _windVariableDirection = windVariableDirection;
    _units = units;
}

  WeatherDto.fromJson(dynamic json) {
    _meta = json["meta"] != null ? Meta.fromJson(json["meta"]) : null;
    _altimeter = json["altimeter"] != null ? Altimeter.fromJson(json["altimeter"]) : null;

    // _flightRules = json["flight_rules"];
    // if (json["other"] != null) {
    //   _other = [];
    //   json["other"].forEach((v) {
    //     _other.add(dynamic.fromJson(v));
    //   });
    // }
    _visibility = json["visibility"] != null ? Visibility.fromJson(json["visibility"]) : null;
    _windDirection = json["wind_direction"] != null ? Wind_direction.fromJson(json["windDirection"]) : null;
    _windGust = json["wind_gust"];
    _windSpeed = json["wind_speed"] != null ? Wind_speed.fromJson(json["windSpeed"]) : null;
    // if (json["wx_codes"] != null) {
    //   _wxCodes = [];
    //   json["wx_codes"].forEach((v) {
    //     _wxCodes.add(dynamic.fromJson(v));
    //   });
    // }
    _raw = json["raw"];
    _sanitized = json["sanitized"];
    _station = json["station"];
    _time = json["time"] != null ? Time.fromJson(json["time"]) : null;
    _remarks = json["remarks"];
    _dewpoint = json["dewpoint"] != null ? Dewpoint.fromJson(json["dewpoint"]) : null;
    _remarksInfo = json["remarks_info"] != null ? Remarks_info.fromJson(json["remarksInfo"]) : null;
    // if (json["runway_visibility"] != null) {
    //   _runwayVisibility = [];
    //   json["runway_visibility"].forEach((v) {
    //     _runwayVisibility.add(dynamic.fromJson(v));
    //   });
    // }
    _temperature = json["temperature"] != null ? Temperature.fromJson(json["temperature"]) : null;
    if (json["wind_variable_direction"] != null) {
      _windVariableDirection = [];
      json["wind_variable_direction"].forEach((v) {
        _windVariableDirection.add(Wind_variable_direction.fromJson(v));
      });
    }
    _units = json["units"] != null ? Units.fromJson(json["units"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_meta != null) {
      map["meta"] = _meta.toJson();
    }
    if (_altimeter != null) {
      map["altimeter"] = _altimeter.toJson();
    }
    // if (_clouds != null) {
    //   map["clouds"] = _clouds.map((v) => v.toJson()).toList();
    // }
    map["flight_rules"] = _flightRules;
    if (_other != null) {
      map["other"] = _other.map((v) => v.toJson()).toList();
    }
    if (_visibility != null) {
      map["visibility"] = _visibility.toJson();
    }
    if (_windDirection != null) {
      map["wind_direction"] = _windDirection.toJson();
    }
    map["wind_gust"] = _windGust;
    if (_windSpeed != null) {
      map["wind_speed"] = _windSpeed.toJson();
    }
    if (_wxCodes != null) {
      map["wx_codes"] = _wxCodes.map((v) => v.toJson()).toList();
    }
    map["raw"] = _raw;
    map["sanitized"] = _sanitized;
    map["station"] = _station;
    if (_time != null) {
      map["time"] = _time.toJson();
    }
    map["remarks"] = _remarks;
    if (_dewpoint != null) {
      map["dewpoint"] = _dewpoint.toJson();
    }
    if (_remarksInfo != null) {
      map["remarks_info"] = _remarksInfo.toJson();
    }
    if (_runwayVisibility != null) {
      map["runway_visibility"] = _runwayVisibility.map((v) => v.toJson()).toList();
    }
    if (_temperature != null) {
      map["temperature"] = _temperature.toJson();
    }
    if (_windVariableDirection != null) {
      map["wind_variable_direction"] = _windVariableDirection.map((v) => v.toJson()).toList();
    }
    if (_units != null) {
      map["units"] = _units.toJson();
    }
    return map;
  }

}

/// altimeter : "hPa"
/// altitude : "ft"
/// temperature : "C"
/// visibility : "m"
/// wind_speed : "m/s"

class Units {
  String _altimeter;
  String _altitude;
  String _temperature;
  String _visibility;
  String _windSpeed;

  String get altimeter => _altimeter;
  String get altitude => _altitude;
  String get temperature => _temperature;
  String get visibility => _visibility;
  String get windSpeed => _windSpeed;

  Units({
      String altimeter, 
      String altitude, 
      String temperature, 
      String visibility, 
      String windSpeed}){
    _altimeter = altimeter;
    _altitude = altitude;
    _temperature = temperature;
    _visibility = visibility;
    _windSpeed = windSpeed;
}

  Units.fromJson(dynamic json) {
    _altimeter = json["altimeter"];
    _altitude = json["altitude"];
    _temperature = json["temperature"];
    _visibility = json["visibility"];
    _windSpeed = json["wind_speed"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["altimeter"] = _altimeter;
    map["altitude"] = _altitude;
    map["temperature"] = _temperature;
    map["visibility"] = _visibility;
    map["wind_speed"] = _windSpeed;
    return map;
  }

}

/// repr : "150"
/// value : 150
/// spoken : "one five zero"

class Wind_variable_direction {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Wind_variable_direction({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Wind_variable_direction.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// repr : "22"
/// value : 22
/// spoken : "two two"

class Temperature {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Temperature({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Temperature.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// dewpoint_decimal : null
/// temperature_decimal : null

class Remarks_info {
  dynamic _dewpointDecimal;
  dynamic _temperatureDecimal;

  dynamic get dewpointDecimal => _dewpointDecimal;
  dynamic get temperatureDecimal => _temperatureDecimal;

  Remarks_info({
      dynamic dewpointDecimal, 
      dynamic temperatureDecimal}){
    _dewpointDecimal = dewpointDecimal;
    _temperatureDecimal = temperatureDecimal;
}

  Remarks_info.fromJson(dynamic json) {
    _dewpointDecimal = json["dewpoint_decimal"];
    _temperatureDecimal = json["temperature_decimal"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dewpoint_decimal"] = _dewpointDecimal;
    map["temperature_decimal"] = _temperatureDecimal;
    return map;
  }

}

/// repr : "06"
/// value : 6
/// spoken : "six"

class Dewpoint {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Dewpoint({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Dewpoint.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// repr : "221500Z"
/// dt : "2021-05-22T15:00:00Z"

class Time {
  String _repr;
  String _dt;

  String get repr => _repr;
  String get dt => _dt;

  Time({
      String repr, 
      String dt}){
    _repr = repr;
    _dt = dt;
}

  Time.fromJson(dynamic json) {
    _repr = json["repr"];
    _dt = json["dt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["dt"] = _dt;
    return map;
  }

}

/// repr : "03"
/// value : 3
/// spoken : "three"

class Wind_speed {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Wind_speed({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Wind_speed.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// repr : "180"
/// value : 180
/// spoken : "one eight zero"

class Wind_direction {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Wind_direction({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Wind_direction.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// repr : "CAVOK"
/// value : 9999
/// spoken : "ceiling and visibility ok"

class Visibility {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Visibility({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Visibility.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// repr : "Q1013"
/// value : 1013
/// spoken : "one zero one three"

class Altimeter {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;
  int get value => _value;
  String get spoken => _spoken;

  Altimeter({
      String repr, 
      int value, 
      String spoken}){
    _repr = repr;
    _value = value;
    _spoken = spoken;
}

  Altimeter.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"];
    _spoken = json["spoken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["value"] = _value;
    map["spoken"] = _spoken;
    return map;
  }

}

/// timestamp : "2021-05-22T15:13:43.657553Z"
/// stations_updated : "2021-04-23"

class Meta {
  String _timestamp;
  String _stationsUpdated;

  String get timestamp => _timestamp;
  String get stationsUpdated => _stationsUpdated;

  Meta({
      String timestamp, 
      String stationsUpdated}){
    _timestamp = timestamp;
    _stationsUpdated = stationsUpdated;
}

  Meta.fromJson(dynamic json) {
    _timestamp = json["timestamp"];
    _stationsUpdated = json["stations_updated"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["timestamp"] = _timestamp;
    map["stations_updated"] = _stationsUpdated;
    return map;
  }

}