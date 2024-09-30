import 'package:worldline/models/geo_coord.dart';

class Poi {
  final String id;
  final String title;
  final String imageUrl;
  final GeoCoord geoCoord;

  Poi(
    this.id,
    this.title,
    this.imageUrl,
    this.geoCoord,
  );

  factory Poi.fromJson(Map json) {
    return Poi(
      json['id'].toString(),
      json['title'].toString(),
      json['image'].toString(),
      GeoCoord.fromString(json['geocoordinates']),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'geocoordinates': '${geoCoord.lat},${geoCoord.lng}',
    };
  }
}
