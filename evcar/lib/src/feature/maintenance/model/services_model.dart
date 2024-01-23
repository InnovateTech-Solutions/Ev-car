class ServicesModel {
  String image;
  String title;
  ServicesModel({required this.image, required this.title});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(image: json[''], title: json['']);
  }
}
