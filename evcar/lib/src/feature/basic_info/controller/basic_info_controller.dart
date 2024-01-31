import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInformationController extends GetxController {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController address = TextEditingController();

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
}
