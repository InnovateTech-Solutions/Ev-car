import 'package:get/get.dart';

class ServiceModel {
  final String id;
  final String name;
  RxBool isTaped;

  ServiceModel({required this.id, required this.name, required this.isTaped});
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'],
      name: json['title'],
      isTaped: false.obs,
    );
  }
}
