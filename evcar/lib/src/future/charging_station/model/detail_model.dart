class ChargingStationModel {
  String name;
  String location;
  String description;
  String phone;
  List<String> feature;

  List<String> charger;
  String image;
  String rate;
  String coordinate;

  ChargingStationModel(
      {required this.charger,
      required this.rate,
      required this.feature,
      required this.coordinate,
      required this.description,
      required this.image,
      required this.location,
      required this.name,
      required this.phone});
}
