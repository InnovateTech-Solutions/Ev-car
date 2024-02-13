import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorAllProductController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController discription = TextEditingController();
  final formKey = GlobalKey<FormState>();
  validname(value) {
    if (GetUtils.isNull(value)) {
      return 'ادخل المعلومات';
    } else {
      return null;
    }
  }

  validprice(value) {
    if (GetUtils.isNull(value)) {
      return 'ادخل المعلومات';
    } else {
      return null;
    }
  }

  validdescription(value) {
    if (GetUtils.isNull(value)) {
      return 'ادخل المعلومات';
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> fetchData(String id) async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/vendors/getAllVendorProductsClassified/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> fetchDataToken(String id) async {
    final response = await http.get(
      Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/vendors/getAllVendorProductsByToken'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $id',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      return responseData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://adventurous-yak-pajamas.cyclic.app/vendors/deleteProduct/$productId'),
      );

      if (response.statusCode == 200) {
        print('Product deleted successfully');
        Get.back();
        update();
      } else {
        print('Failed to delete product. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  Future<void> updateProduct(String productId) async {
    try {
      final response = await http.put(
          Uri.parse(
              'https://adventurous-yak-pajamas.cyclic.app/vendors/updateProduct/$productId'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'title': title.text,
              'description': discription.text,
              'price': price.text,
            },
          ));

      update();
      if (response.statusCode == 200) {
        print('Product updated successfully');
        final responseData = json.decode(response.body);
        print('Updated user details: $responseData');
        update();
      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating product: $e');
    }
  }
}
