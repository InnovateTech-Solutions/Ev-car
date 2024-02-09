import 'dart:convert';

import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShopController extends GetxController {
  final ratingDescription = TextEditingController();
  var carServices = <Product>[].obs;
  var accessories = <Product>[].obs;

  Future<void> fetchProductsByVendorId(String vendorId) async {
    final response = await http.get(Uri.parse(
        "https://adventurous-yak-pajamas.cyclic.app/vendors/getAllVendorProductsClassified/$vendorId"));

    if (response.body.isEmpty) {
      throw Exception('Failed to load datsa');
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data.containsKey('classifiedProducts')) {
        final classifiedProducts =
            data['classifiedProducts'] as Map<String, dynamic>;

        if (classifiedProducts.containsKey('car service')) {
          carServices.clear();
          final carServiceList =
              classifiedProducts['car service'] as List<dynamic>;
          carServices.addAll(carServiceList
              .map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList());
        } else {
          print("object");
        }

        if (classifiedProducts.containsKey('car accessories')) {
          accessories.clear();
          final accessoriesList =
              classifiedProducts['car accessories'] as List<dynamic>;
          accessories.addAll(accessoriesList
              .map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList());
        }
      }
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
