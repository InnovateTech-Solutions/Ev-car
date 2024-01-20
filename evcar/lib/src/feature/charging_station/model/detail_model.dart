import 'package:get/get.dart';

class ChargingStation {
  final String id;
  final String title;
  final String address;
  final String coordinates;
  final String number;
  final String type;
  final String image;
  bool liked;
  final List<ChargerModel>? chargers;
  final List<dynamic> features;

  ChargingStation({
    required this.id,
    required this.title,
    this.liked = false,
    this.image = '',
    this.address = '',
    this.coordinates = '',
    this.number = '',
    required this.features,
    required this.type,
    this.chargers,
  });
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'img': image,
      'features': features,
      'address': address,
      'coordinates': coordinates,
      'number': number,
      'type': type,
      'chargers': chargers?.map((charger) => charger.toJson()).toList(),
    };
  }

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
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
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
    };
  }
}
