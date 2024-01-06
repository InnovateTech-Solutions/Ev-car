class ChargingStationModel {
  final String id;
  final String title;
  final String address;
  final String coordinates;
  final String number;
  final String type;
  final String image;
  final List<ChargerModel> chargers;
  final List<dynamic> features;

  ChargingStationModel({
    required this.id,
    required this.title,
    required this.image,
    required this.address,
    required this.coordinates,
    required this.number,
    required this.features,
    required this.type,
    required this.chargers,
  });

  factory ChargingStationModel.fromJson(Map<String, dynamic> json) {
    return ChargingStationModel(
      id: json['_id'],
      title: json['title'],
      image: json['img'],
      features: json['features'],
      address: json['address'],
      coordinates: json['coordinates'],
      number: json['number'],
      type: json['type'],
      chargers: (json['chargers'] as List<dynamic>)
          .map((charger) => ChargerModel.fromJson(charger))
          .toList(),
    );
  }
}

class ChargerModel {
  final String id;
  final String title;
  final String image;

  ChargerModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory ChargerModel.fromJson(Map<String, dynamic> json) {
    return ChargerModel(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
