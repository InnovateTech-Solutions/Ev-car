import 'dart:convert';
import 'dart:io';

import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../vendor_account/model/vednor_model.dart';

class BasicInformationController extends GetxController {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController address = TextEditingController();
  String imageUrl = '';
  final formKey = GlobalKey<FormState>();
  File? sotreImageFile;
  RxString imagePath = ''.obs;
  Rx<PlatformFile?> selectedImage = Rx<PlatformFile?>(null);
  final TextEditingController pictureBase64 = TextEditingController();

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      sotreImageFile = File(result.files.single.path!);
      selectedImage.value = result.files.single;
      imagePath.value = result.files.single.path!;
      print(imagePath.value);
    }
  }

  Future<void> uploadStoreImage() async {
    if (sotreImageFile != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$fileName.png');
      UploadTask uploadTask = storageReference.putFile(sotreImageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      update(); // Notify listeners that the state has changed
    } else {
      print('No image selected.');
    }
  }

  Future<Vendor> getUserDetails(String token) async {
    print(token);
    final response = await http.get(
      Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/vendors/getVendorDetails'),
      headers: {
        'Authorization': 'Bearer  $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Vendor vendor = Vendor.fromMap(responseData);

      phoneNumber.text = vendor.number;
      username.text = vendor.title;
      address.text = vendor.address;
      imageUrl = vendor.img;

      return vendor;
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<void> putUserDetails(
      String img, String username, String address, String token) async {
    try {
      final response = await http.put(
        Uri.parse('https://adventurous-yak-pajamas.cyclic.app/vendors/update'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({"title": username, "address": address, "img": img}),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        print('Updated user details: $responseData');
        // Assuming you want to update UI with the new data, you can put your UI update logic here
      } else {
        throw Exception(
            'Failed to update user details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      // Show error message to the user using SnackBar
    }
  }

  Future<void> AddBasicInfo() async {
    if (formKey.currentState!.validate()) {
    } else {
      Get.snackbar("ERROR", "Invalid Data",
          titleText: Align(
            alignment: Alignment.bottomCenter,
            child: searchsec('حدث خطأ'),
          ));
    }
  }

  onUpdate(
      {required String token,
      required String userName,
      required String address}) async {
    print('the image $imageUrl');
    if (formKey.currentState!.validate()) {
      {
        await uploadStoreImage();
        // print(vendor.commercialLicense);

        print("the image $imageUrl"); // store img
        await putUserDetails(imageUrl, userName, address, token);
      }
    }
    update();
  }
}
