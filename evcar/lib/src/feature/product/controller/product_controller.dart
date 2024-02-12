import 'dart:convert';

import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/product/model/product_detail_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(
        "https://adventurous-yak-pajamas.cyclic.app/vendors/getAllProducts"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey("allProducts")) {
        // Check for "allProducts" instead of "vendors"
        List<dynamic> productData = data["allProducts"];
        List<Product> products =
            productData.map((item) => Product.fromJson(item)).toList();
        print(products.length);
        return products;
      } else {
        throw Exception('Invalid data format: missing "allProducts" key');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ProductDetails> fetchProductById(String productId) async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/vendors/getProductById/$productId'));
    print(response.body);
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      print(response.statusCode);
      return ProductDetails.fromJson(jsonMap['product']);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<List<VendorProduct>> fetchProductByType(String typeId) async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/vendors/getProductsByType/$typeId'));
    print(typeId);

    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body)['products'];
      print(typeId);
      return productList.map((json) => VendorProduct.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
