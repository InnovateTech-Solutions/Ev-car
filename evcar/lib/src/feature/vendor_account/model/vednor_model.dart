class Vendor {
  String id;
  String title;
  String subtitle;
  String img;
  String address;
  String coordinates;
  String number;
  String commercialLicense;
  String password;
  String type;
  String rating;
  List<String> tags; // Assuming tags are represented as Strings in Dart
  String description;
  String status;

  Vendor({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.img,
    required this.address,
    this.coordinates = "",
    required this.number,
    required this.commercialLicense,
    required this.password,
    required this.type,
    this.rating = "",
    required this.tags,
    required this.description,
    required this.status,
  });

  // You might want to add a factory constructor to convert a Map to Vendor
  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      id: map['_id'],
      title: map['title'],
      subtitle: map['subtitle'],
      img: map['img'] ?? "",
      address: map['address'],
      coordinates: map['coordinates'] ?? "",
      number: map['number'],
      commercialLicense: map['commercialLicense'] ?? "",
      password: map['password'],
      type: map['type'],
      //  rating: map['rating'] ?? "",
      tags: List<String>.from(map['tags'] ?? []),
      description: map['description'] ?? "",
      status: map['status'],
    );
  }

  // You can also add a method to convert the Vendor to a Map for serialization
  toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'img': img,
      'address': address,
      'coordinates': coordinates,
      'number': number,
      'commercialLicense': commercialLicense,
      'password': password,
      'type': type,
      'tags': tags,
      'description': description,
      'status': status,
    };
  }
}
