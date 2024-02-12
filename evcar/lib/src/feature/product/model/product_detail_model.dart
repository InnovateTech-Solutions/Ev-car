import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';

class ProductDetails {
  final String id;
  final String title;
  final List<String> images;
  final String description;
  final String price;
  final TypeOfProduct typeOfProduct;
  final Vendor vendor;

  ProductDetails({
    required this.id,
    required this.title,
    required this.images,
    required this.description,
    required this.price,
    required this.typeOfProduct,
    required this.vendor,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      images: List<String>.from(json['img'] ?? ''),
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      typeOfProduct: TypeOfProduct.fromJson(json['typeOfProduct'] ?? ''),
      vendor: Vendor.fromMap(json['vendor'] ?? ''),
    );
  }
}

class TypeOfProduct {
  final String id;
  final String title;

  TypeOfProduct({
    required this.id,
    required this.title,
  });

  factory TypeOfProduct.fromJson(Map<String, dynamic> json) {
    return TypeOfProduct(
      id: json['_id'],
      title: json['title'],
    );
  }
}
