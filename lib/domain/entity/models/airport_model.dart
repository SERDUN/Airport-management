class AirportModel {
  final String name;
  final String code;
  final String timeZone;
  final String country;
  final String distance;

  AirportModel(this.name, this.code,
      {this.timeZone, this.country, this.distance});
}
