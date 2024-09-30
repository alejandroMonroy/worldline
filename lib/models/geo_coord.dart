class GeoCoord {
  final double lat;
  final double lng;

  GeoCoord(
    this.lat,
    this.lng,
  );

  factory GeoCoord.fromJson(Map json) {
    final [lat, lng] = json['geocoordinates'];

    return GeoCoord(
      double.tryParse(lat) ?? 0.0,
      double.tryParse(lng) ?? 0.0,
    );
  }

  factory GeoCoord.fromString(String coords) {
    final [lat, lng] = coords.split(',');

    return GeoCoord(
      double.tryParse(lat) ?? 0.0,
      double.tryParse(lng) ?? 0.0,
    );
  }
}
