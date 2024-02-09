class Product {
  final String id;
  final String price;
  final String title;
  final List img;
  final String description;
  final String typeOfProduct;
  final String vendor;

  Product({
    required this.id,
    required this.title,
    required this.img,
    required this.price,
    required this.description,
    required this.typeOfProduct,
    required this.vendor,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'] ?? '',
      img: json['img'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      typeOfProduct: json['typeOfProduct'] ?? '',
      vendor: json['vendor'] ?? '',
    );
  }
}
