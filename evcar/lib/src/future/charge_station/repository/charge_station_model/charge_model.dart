class ChargeModel {
  String id;
  String title;
  String address;
  String coordinates;
  String number;
  String type;
  List<Charger> chargers;
  List<String> features;
  int version;
  String img;

  ChargeModel({
    required this.img,
    required this.features,
    required this.id,
    required this.title,
    required this.address,
    required this.coordinates,
    required this.number,
    required this.type,
    required this.chargers,
    required this.version,
  });

  factory ChargeModel.fromJson(Map<String, dynamic> json) {
    return ChargeModel(
      id: json['_id'],
      title: json['title'],
      img: json['img'],
      address: json['address'],
      coordinates: json['coordinates'],
      number: json['number'],
      type: json['type'],
      features: (json['features'] as List<dynamic>?)!.cast<String>(),
      chargers: (json['chargers'] as List<dynamic>)
          .map((charger) => Charger.fromJson(charger))
          .toList(),
      version: json['__v'],
    );
  }
}

class Charger {
  String id;
  String title;
  String image;
  int version;

  Charger({
    required this.id,
    required this.title,
    required this.image,
    required this.version,
  });

  factory Charger.fromJson(Map<String, dynamic> json) {
    return Charger(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      version: json['__v'],
    );
  }
}
