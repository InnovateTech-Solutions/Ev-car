class PartsModel {
  String title;
  String vendor;
  String type;
  String vendorAddress;
  String price;
  String phone;

  String image;

  PartsModel({
    required this.title,
    required this.type,
    required this.phone,
    required this.image,
    required this.price,
    required this.vendor,
    required this.vendorAddress,
  });
}
