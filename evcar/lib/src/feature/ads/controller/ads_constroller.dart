import 'dart:convert';
import 'dart:io';

import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AdsController extends GetxController {
  //form
  final adsName = TextEditingController();
  final price = TextEditingController();
  final phone = TextEditingController();
  final description = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  Rx<File?> image = Rx<File?>(null);

  final RegExp _priceRegex = RegExp(r'^\d+(\.\d{1,2})?$');
  //type
  var TypeValue = "x".obs;
  List<String> TypeList = ['x', 'Option 2', 'Option 3', 'Option 4'];
  //type
  var categoryValue = "عروض".obs;
  List<String> categoryList = [
    'عروض',
    'اعلان',
  ];
  //drive
  var driveValue = "No".obs;
  List<String> driveList = ['No', 'Yes'];

  //validation
  bool isValidPrice(String value) {
    return _priceRegex.hasMatch(value);
  }

  priceValid(value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال السعر';
    }
    if (!isValidPrice(value)) {
      return 'يرجى إدخال سعر مقبول';
    }
    return null;
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
      return null;
    }
    return 'رقم الهاتف غير صالح';
  }

  validAdsName(String? name) {
    if (name!.isEmpty) {
      return "اسم المستخدم غير صالح";
    }
    return null;
  }

  validDescription(String? description) {
    if (description!.isEmpty) {
      return "يرجى ادخال الوصف";
    }
    return null;
  }

  //Image
  RxList<File> adsImage = <File>[].obs;
  RxList<String> imageUrlList = <String>[].obs;
  final picker = ImagePicker();

  Future<void> pickImages(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      adsImage.length > index
          ? adsImage[index] = File(pickedFile.path)
          : adsImage.add(File(pickedFile.path));
    }
    // print(adsImage);
    // print(adsImage.length);
  }

  Future<void> addFile() async {
    for (int i = 0; i < adsImage.length; i++) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images')
          .child('filename${i + 1}.jpg');
      await storageReference.putFile(File(adsImage[i].path));
      String imageUrl = await storageReference.getDownloadURL();
      imageUrlList.add(imageUrl);
      print(imageUrlList[i]);
    }
  }

  Future<void> addAds() async {
    if (fromKey.currentState!.validate()) {
      if (imageUrlList.isNotEmpty) {
      } else {
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.bottomCenter,
              child: searchsec('حدث خطأ'),
            ));
      }
    } else {
      Get.snackbar("ERROR", "Invalid Data",
          titleText: Align(
            alignment: Alignment.bottomCenter,
            child: searchsec('حدث خطأ'),
          ));
    }
  }

  var typeList = [].obs; // Observable list to hold product types

  @override
  void onInit() {
    super.onInit();
    fetchProductTypes();
  }

  // Function to fetch product types from the API
  Future<void> fetchProductTypes() async {
    try {
      final response = await http.get(Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/typeOfProducts/getAllTypeOfProducts'));
      if (response.statusCode == 200) {
        final List<dynamic> types = json.decode(response.body);
        updateTypeList(types);
      } else {
        throw Exception('Failed to fetch product types');
      }
    } catch (e) {
      print('Error fetching product types: $e');
    }
  }

  // Method to update the list of product types
  void updateTypeList(List<dynamic> newTypes) {
    typeList.clear(); // Clear the existing list
    typeList.addAll(newTypes); // Add new types to the list
  }
}
