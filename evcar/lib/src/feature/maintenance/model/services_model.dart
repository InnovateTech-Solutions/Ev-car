class ServicesModel {
  String id;
  String image;
  String title;
  ServicesModel({required this.id, required this.image, required this.title});

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
        id: json['_id'], image: json['image'], title: json['title']);
  }
}
