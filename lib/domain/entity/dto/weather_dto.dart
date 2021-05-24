/// meta : {"timestamp":"2021-05-23T09:59:49.336568Z","stations_updated":"2021-04-23"}
/// altimeter : {"repr":"Q1016","value":1016,"spoken":"one zero one six"}
/// clouds : [{"repr":"BKN049","type":"BKN","altitude":49,"modifier":null,"direction":null}]
/// flight_rules : "VFR"
/// other : []
/// visibility : {"repr":"9999","value":9999,"spoken":"nine nine nine nine"}
/// wind_direction : {"repr":"210","value":210,"spoken":"two one zero"}
/// wind_gust : null
/// wind_speed : {"repr":"03","value":3,"spoken":"three"}
/// wx_codes : []
/// raw : "UKLL 230930Z 21003MPS 160V270 9999 BKN049 17/07 Q1016 R31/D NOSIG"
/// sanitized : "UKLL 230930Z 21003MPS 160V270 9999 BKN049 17/07 Q1016 R31/D NOSIG"
/// station : "UKLL"
/// time : {"repr":"230930Z","dt":"2021-05-23T09:30:00Z"}
/// remarks : "R31/D NOSIG"
/// dewpoint : {"repr":"07","value":7,"spoken":"seven"}
/// remarks_info : {"dewpoint_decimal":null,"temperature_decimal":null}
/// runway_visibility : []
/// temperature : {"repr":"17","value":17,"spoken":"one seven"}
/// wind_variable_direction : [{"repr":"160","value":160,"spoken":"one six zero"},{"repr":"270","value":270,"spoken":"two seven zero"}]
/// units : {"altimeter":"hPa","altitude":"ft","temperature":"C","visibility":"m","wind_speed":"m/s"}

class WeatherDto {
  Meta _meta;
  Altimeter _altimeter;
  List<Clouds> _clouds;
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

  List<Clouds> get clouds => _clouds;

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

  List<Wind_variable_direction> get windVariableDirection =>
      _windVariableDirection;

  Units get units => _units;

  Weather_dto(
      {Meta meta,
      Altimeter altimeter,
      List<Clouds> clouds,
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
      Units units}) {
    _meta = meta;
    _altimeter = altimeter;
    _clouds = clouds;
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
    _altimeter = json["altimeter"] != null
        ? Altimeter.fromJson(json["altimeter"])
        : null;
    if (json["clouds"] != null) {
      _clouds = [];
      json["clouds"].forEach((v) {
        _clouds.add(Clouds.fromJson(v));
      });
    }
    _flightRules = json["flight_rules"];
    // if (json["other"] != null) {
    //   _other = [];
    // json["other"].forEach((v) {
    //   _other.add(dynamic.fromJson(v));
    // });
    //}
    _visibility = json["visibility"] != null
        ? Visibility.fromJson(json["visibility"])
        : null;
    _windDirection = json["wind_direction"] != null
        ? Wind_direction.fromJson(json["wind_direction"])
        : null;
    _windGust = json["wind_gust"];
    _windSpeed = json["wind_speed"] != null
        ? Wind_speed.fromJson(json["wind_speed"])
        : null;
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
    _dewpoint =
        json["dewpoint"] != null ? Dewpoint.fromJson(json["dewpoint"]) : null;
    _remarksInfo = json["remarks_info"] != null
        ? Remarks_info.fromJson(json["remarks_info"])
        : null;
    // if (json["runway_visibility"] != null) {
    //   _runwayVisibility = [];
    //   json["runway_visibility"].forEach((v) {
    //     _runwayVisibility.add(dynamic.fromJson(v));
    //   });
    // }
    _temperature = json["temperature"] != null
        ? Temperature.fromJson(json["temperature"])
        : null;
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
    if (_clouds != null) {
      map["clouds"] = _clouds.map((v) => v.toJson()).toList();
    }
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
      map["runway_visibility"] =
          _runwayVisibility.map((v) => v.toJson()).toList();
    }
    if (_temperature != null) {
      map["temperature"] = _temperature.toJson();
    }
    if (_windVariableDirection != null) {
      map["wind_variable_direction"] =
          _windVariableDirection.map((v) => v.toJson()).toList();
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

  Units(
      {String altimeter,
      String altitude,
      String temperature,
      String visibility,
      String windSpeed}) {
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

/// repr : "160"
/// value : 160
/// spoken : "one six zero"

class Wind_variable_direction {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;

  int get value => _value;

  String get spoken => _spoken;

  Wind_variable_direction({String repr, int value, String spoken}) {
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

/// repr : "17"
/// value : 17
/// spoken : "one seven"

class Temperature {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;

  int get value => _value;

  String get spoken => _spoken;

  Temperature({String repr, int value, String spoken}) {
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

  Remarks_info({dynamic dewpointDecimal, dynamic temperatureDecimal}) {
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

/// repr : "07"
/// value : 7
/// spoken : "seven"

class Dewpoint {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;

  int get value => _value;

  String get spoken => _spoken;

  Dewpoint({String repr, int value, String spoken}) {
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

/// repr : "230930Z"
/// dt : "2021-05-23T09:30:00Z"

class Time {
  String _repr;
  String _dt;

  String get repr => _repr;

  String get dt => _dt;

  Time({String repr, String dt}) {
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

  Wind_speed({String repr, int value, String spoken}) {
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

/// repr : "210"
/// value : 210
/// spoken : "two one zero"

class Wind_direction {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;

  int get value => _value;

  String get spoken => _spoken;

  Wind_direction({String repr, int value, String spoken}) {
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

/// repr : "9999"
/// value : 9999
/// spoken : "nine nine nine nine"

class Visibility {
  String _repr;
  int _value;
  String _spoken;

  String get repr => _repr;

  int get value => _value;

  String get spoken => _spoken;

  Visibility({String repr, int value, String spoken}) {
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

/// repr : "BKN049"
/// type : "BKN"
/// altitude : 49
/// modifier : null
/// direction : null

class Clouds {
  String _repr;
  String _type;
  int _altitude;
  dynamic _modifier;
  dynamic _direction;

  String get repr => _repr;

  String get type => _type;

  int get altitude => _altitude;

  dynamic get modifier => _modifier;

  dynamic get direction => _direction;

  Clouds(
      {String repr,
      String type,
      int altitude,
      dynamic modifier,
      dynamic direction}) {
    _repr = repr;
    _type = type;
    _altitude = altitude;
    _modifier = modifier;
    _direction = direction;
  }

  Clouds.fromJson(dynamic json) {
    _repr = json["repr"];
    _type = json["type"];
    _altitude = json["altitude"];
    _modifier = json["modifier"];
    _direction = json["direction"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["repr"] = _repr;
    map["type"] = _type;
    map["altitude"] = _altitude;
    map["modifier"] = _modifier;
    map["direction"] = _direction;
    return map;
  }
}

/// repr : "Q1016"
/// value : 1016
/// spoken : "one zero one six"

class Altimeter {
  String _repr;
  String _value;
  String _spoken;

  String get repr => _repr;

  String get value => _value;

  String get spoken => _spoken;

  Altimeter({String repr, String value, String spoken}) {
    _repr = repr;
    _value = value;
    _spoken = spoken;
  }

  Altimeter.fromJson(dynamic json) {
    _repr = json["repr"];
    _value = json["value"].toString();
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

/// timestamp : "2021-05-23T09:59:49.336568Z"
/// stations_updated : "2021-04-23"

class Meta {
  String _timestamp;
  String _stationsUpdated;

  String get timestamp => _timestamp;

  String get stationsUpdated => _stationsUpdated;

  Meta({String timestamp, String stationsUpdated}) {
    _timestamp = timestamp;
    _stationsUpdated = stationsUpdated;
  }

  Meta.fromJson(dynamic json) {
    _timestamp = json["timestamp"].toString();
    _stationsUpdated = json["stations_updated"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["timestamp"] = _timestamp;
    map["stations_updated"] = _stationsUpdated;
    return map;
  }
}
