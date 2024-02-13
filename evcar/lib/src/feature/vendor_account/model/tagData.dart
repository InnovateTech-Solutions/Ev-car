import 'package:evcar/src/feature/vendor_account/model/service_model.dart';

class TagData {
  final ServiceModel tag;
  final bool exists;

  TagData({
    required this.tag,
    required this.exists,
  });

  factory TagData.fromJson(Map<String, dynamic> json) {
    return TagData(
      tag: ServiceModel.fromJson(json['tag']),
      exists: json['exists'],
    );
  }
}
