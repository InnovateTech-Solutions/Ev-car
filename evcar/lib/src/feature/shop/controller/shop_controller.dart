import 'dart:convert';

import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShopController extends GetxController {
  final ratingDescription = TextEditingController();
  final rating = 0.0.obs;

  var carServices = <Product>[].obs;
  var accessories = <Product>[].obs;
  final fromKey = GlobalKey<FormState>();

  validUsername(String? name) {
    if (name!.isEmpty) {
      return " الملاحظات غير صالحة";
    }
    return null;
  }

  Future<void> fetchProductsByVendorId(String vendorId) async {
    final response = await http
        .get(Uri.parse("${ApiKey.fetchAllVendorProductsClassified}$vendorId"));

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

  Future<void> addReview(
      String rating, String comment, String vendorId, String token) async {
    if (fromKey.currentState!.validate() && this.rating.value != 0.0) {
    } else {
      Get.snackbar("ERROR", "Invalid data",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppTheme.lightAppColors.background,
          backgroundColor: Colors.red);
    }
    final response = await http.post(
      Uri.parse(ApiKey.addReview),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'vendorId': vendorId,
        'rating': rating,
        'comment': comment,
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      Get.back();
      Get.snackbar("تمت إضافة التقييم بنجاح", "",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppTheme.lightAppColors.background,
          backgroundColor: Colors.green);
      print('Add Rating: $responseData');
    } else {
      throw Exception('Failed to Add Rating');
    }
  }
}
