/// GMT : "8"
/// codeIataAirport : "BUW"
/// codeIataCity : "BUW"
/// codeIcaoAirport : "WAWB"
/// codeIso2Country : "ID"
/// distance : 0.0033247119
/// latitudeAirport : -5.466667
/// longitudeAirport : 122.63333
/// nameAirport : "Baubau"
/// nameCountry : "Indonesia"
/// phone : ""
/// timezone : "Asia/Makassar"

List<AirportDTO> airportToList(List list) => new List<AirportDTO>.from(list.map(
        (x)
=> AirportDTO.fromJson(x)));


class AirportDTO {
  String _gmt;
  String _codeIataAirport;
  String _codeIataCity;
  String _codeIcaoAirport;
  String _codeIso2Country;
  double _distance;
  double _latitudeAirport;
  double _longitudeAirport;
  String _nameAirport;
  String _nameCountry;
  String _phone;
  String _timezone;

  String get gmt => _gmt;
  String get codeIataAirport => _codeIataAirport;
  String get codeIataCity => _codeIataCity;
  String get codeIcaoAirport => _codeIcaoAirport;
  String get codeIso2Country => _codeIso2Country;
  double get distance => _distance;
  double get latitudeAirport => _latitudeAirport;
  double get longitudeAirport => _longitudeAirport;
  String get nameAirport => _nameAirport;
  String get nameCountry => _nameCountry;
  String get phone => _phone;
  String get timezone => _timezone;

  AirportDTO({
      String gmt, 
      String codeIataAirport, 
      String codeIataCity, 
      String codeIcaoAirport, 
      String codeIso2Country, 
      double distance, 
      double latitudeAirport, 
      double longitudeAirport, 
      String nameAirport, 
      String nameCountry, 
      String phone, 
      String timezone}){
    _gmt = gmt;
    _codeIataAirport = codeIataAirport;
    _codeIataCity = codeIataCity;
    _codeIcaoAirport = codeIcaoAirport;
    _codeIso2Country = codeIso2Country;
    _distance = distance;
    _latitudeAirport = latitudeAirport;
    _longitudeAirport = longitudeAirport;
    _nameAirport = nameAirport;
    _nameCountry = nameCountry;
    _phone = phone;
    _timezone = timezone;
}

  AirportDTO.fromJson(dynamic json) {
    _gmt = json["GMT"];
    _codeIataAirport = json["codeIataAirport"];
    _codeIataCity = json["codeIataCity"];
    _codeIcaoAirport = json["codeIcaoAirport"];
    _codeIso2Country = json["codeIso2Country"];
    _distance = json["distance"];
    _latitudeAirport = json["latitudeAirport"];
    _longitudeAirport = json["longitudeAirport"];
    _nameAirport = json["nameAirport"];
    _nameCountry = json["nameCountry"];
    _phone = json["phone"];
    _timezone = json["timezone"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["GMT"] = _gmt;
    map["codeIataAirport"] = _codeIataAirport;
    map["codeIataCity"] = _codeIataCity;
    map["codeIcaoAirport"] = _codeIcaoAirport;
    map["codeIso2Country"] = _codeIso2Country;
    map["distance"] = _distance;
    map["latitudeAirport"] = _latitudeAirport;
    map["longitudeAirport"] = _longitudeAirport;
    map["nameAirport"] = _nameAirport;
    map["nameCountry"] = _nameCountry;
    map["phone"] = _phone;
    map["timezone"] = _timezone;
    return map;
  }

}