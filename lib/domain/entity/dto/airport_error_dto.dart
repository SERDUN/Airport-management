/// error : "Your API Call Limit is Over."
/// success : false

class AirportErrorDTO {
  String _error;
  bool _success;

  String get error => _error;
  bool get success => _success;

  AirportErrorDTO({
      String error, 
      bool success}){
    _error = error;
    _success = success;
}

  AirportErrorDTO.fromJson(dynamic json) {
    _error = json["error"];
    _success = json["success"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["success"] = _success;
    return map;
  }

}