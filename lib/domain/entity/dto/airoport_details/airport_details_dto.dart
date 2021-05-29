/// airport : {"name":"Odessa International Airport","city":"Odessa","iata":"ODS","full_location":"Odessa, Odessa, Ukraine","type":"airport","latitude":"46.429827","longitude":"30.677441","elevation":"161","website":"http://www.airport.od.ua/","country":{"name":"Ukraine","iso":"UA"},"state":{"name":"Odessa","type":"Province"},"continent":{"abbr":"EU","name":"Europe"}}
/// term : "ODS"
/// status : true
/// statusCode : 200

class AirportDetailsDTO {
  Airport _airport;
  String _term;
  bool _status;
  int _statusCode;

  Airport get airport => _airport;
  String get term => _term;
  bool get status => _status;
  int get statusCode => _statusCode;

  AirportDetailsDTO({
      Airport airport, 
      String term, 
      bool status, 
      int statusCode}){
    _airport = airport;
    _term = term;
    _status = status;
    _statusCode = statusCode;
}

  AirportDetailsDTO.fromJson(dynamic json) {
    _airport = json["airport"] != null ? Airport.fromJson(json["airport"]) : null;
    _term = json["term"];
    _status = json["status"];
    _statusCode = json["statusCode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_airport != null) {
      map["airport"] = _airport.toJson();
    }
    map["term"] = _term;
    map["status"] = _status;
    map["statusCode"] = _statusCode;
    return map;
  }

}

/// name : "Odessa International Airport"
/// city : "Odessa"
/// iata : "ODS"
/// full_location : "Odessa, Odessa, Ukraine"
/// type : "airport"
/// latitude : "46.429827"
/// longitude : "30.677441"
/// elevation : "161"
/// website : "http://www.airport.od.ua/"
/// country : {"name":"Ukraine","iso":"UA"}
/// state : {"name":"Odessa","type":"Province"}
/// continent : {"abbr":"EU","name":"Europe"}

class Airport {
  String _name;
  String _city;
  String _iata;
  String _fullLocation;
  String _type;
  String _latitude;
  String _longitude;
  String _elevation;
  String _website;
  Country _country;
  State _state;
  Continent _continent;

  String get name => _name;
  String get city => _city;
  String get iata => _iata;
  String get fullLocation => _fullLocation;
  String get type => _type;
  String get latitude => _latitude;
  String get longitude => _longitude;
  String get elevation => _elevation;
  String get website => _website;
  Country get country => _country;
  State get state => _state;
  Continent get continent => _continent;

  Airport({
      String name, 
      String city, 
      String iata, 
      String fullLocation, 
      String type, 
      String latitude, 
      String longitude, 
      String elevation, 
      String website, 
      Country country, 
      State state, 
      Continent continent}){
    _name = name;
    _city = city;
    _iata = iata;
    _fullLocation = fullLocation;
    _type = type;
    _latitude = latitude;
    _longitude = longitude;
    _elevation = elevation;
    _website = website;
    _country = country;
    _state = state;
    _continent = continent;
}

  Airport.fromJson(dynamic json) {
    _name = json["name"];
    _city = json["city"];
    _iata = json["iata"];
    _fullLocation = json["full_location"];
    _type = json["type"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
    _elevation = json["elevation"];
    _website = json["website"];
    _country = json["country"] != null ? Country.fromJson(json["country"]) : null;
    _state = json["state"] != null ? State.fromJson(json["state"]) : null;
    _continent = json["continent"] != null ? Continent.fromJson(json["continent"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["city"] = _city;
    map["iata"] = _iata;
    map["full_location"] = _fullLocation;
    map["type"] = _type;
    map["latitude"] = _latitude;
    map["longitude"] = _longitude;
    map["elevation"] = _elevation;
    map["website"] = _website;
    if (_country != null) {
      map["country"] = _country.toJson();
    }
    if (_state != null) {
      map["state"] = _state.toJson();
    }
    if (_continent != null) {
      map["continent"] = _continent.toJson();
    }
    return map;
  }

}

/// abbr : "EU"
/// name : "Europe"

class Continent {
  String _abbr;
  String _name;

  String get abbr => _abbr;
  String get name => _name;

  Continent({
      String abbr, 
      String name}){
    _abbr = abbr;
    _name = name;
}

  Continent.fromJson(dynamic json) {
    _abbr = json["abbr"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["abbr"] = _abbr;
    map["name"] = _name;
    return map;
  }

}

/// name : "Odessa"
/// type : "Province"

class State {
  String _name;
  String _type;

  String get name => _name;
  String get type => _type;

  State({
      String name, 
      String type}){
    _name = name;
    _type = type;
}

  State.fromJson(dynamic json) {
    _name = json["name"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["type"] = _type;
    return map;
  }

}

/// name : "Ukraine"
/// iso : "UA"

class Country {
  String _name;
  String _iso;

  String get name => _name;
  String get iso => _iso;

  Country({
      String name, 
      String iso}){
    _name = name;
    _iso = iso;
}

  Country.fromJson(dynamic json) {
    _name = json["name"];
    _iso = json["iso"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["iso"] = _iso;
    return map;
  }

}