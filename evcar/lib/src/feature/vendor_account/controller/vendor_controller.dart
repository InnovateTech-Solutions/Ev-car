import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:evcar/src/core/constants/api_key.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:evcar/src/feature/vendor_account/model/service_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:evcar/src/feature/vendor_map/view/page/vendor_map_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../config/theme/theme.dart';

class VendorController extends GetxController {
  static VendorController get instance => Get.find();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final TextEditingController pictureBase64 = TextEditingController();
  final TextEditingController pBase64 = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController pictureofLicence = TextEditingController();
  final TextEditingController description = TextEditingController();
  final vendorKey = GlobalKey<FormState>();
  Rx<PlatformFile?> selectedImage = Rx<PlatformFile?>(null);
  Rx<PlatformFile?> selectedLicense = Rx<PlatformFile?>(null);
  RxBool hide = true.obs;
  RxString imagePath = ''.obs;
  RxString imageLicense = ''.obs;
  RxBool isTap = false.obs;
  List<String> serviceName = [];
  List<String> serviceID = [];
  RxList<ServiceModel> serviceList = <ServiceModel>[].obs;
  File? sotreImageFile;
  String imageUrl = '';
  Rx<File?> storeImage = Rx<File?>(null);
  RxString storeImageUrl = RxString('');
  File? storeLicence;
  String licenceUrl = '';

  RxBool serviceIsEmpty = false.obs;
  RxBool imageIsEmpty = false.obs;
  RxBool licenseIsEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length >= 9) {
      if (GetUtils.isPhoneNumber(phoneNumber)) {
        return null;
      } else {
        return 'رقم الهاتف غير صالح';
      }
    } else {
      return 'رقم الهاتف يجب أن يكون من 10 أرقام';
    }
  }

  vaildPassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return ' الرقم السري غير صالحة';
    }
    return null;
  }

  String removeLeadingZero(String input) {
    return input.replaceAll(RegExp('^0+'), '');
  }

  validtionFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'اسم المركز غير صالح';
    }
  }

  validtionImageFiled(String? filed) {
    if (filed!.isEmpty) {
      return 'ادخل صورة للمركز';
    }
  }

  hidePassword() {
    if (hide.value == false) {
      hide.value = true;
    } else if (hide.value == true) {
      hide.value = false;
    }
  }

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

  Future<void> pickLicense() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      storeLicence = File(result.files.single.path!);
      selectedImage.value = result.files.single;
      imageLicense.value = result.files.single.path!;

      print(imageLicense.value);
    }
  }

  Future<String> imageToBase64(String imagePath) async {
    try {
      // Read the image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();

      // Convert bytes to base64
      String base64Image = base64Encode(Uint8List.fromList(imageBytes));

      return base64Image;
    } catch (e) {
      print('Error converting image to base64: $e');
      return ''; // Return an empty string or handle the error as needed
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

  Future<void> uploadStoreLicence() async {
    if (storeLicence != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$fileName.png');
      UploadTask uploadTask = storageReference.putFile(storeLicence!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      licenceUrl = await taskSnapshot.ref.getDownloadURL();

      update(); // Notify listeners that the state has changed
    } else {
      print('No image selected.');
    }
  }

  void isSelectedService(ServiceModel service) {
    bool serviceExists = serviceName.contains(service.name);

    if (serviceExists) {
      serviceID.remove(service.id);
      serviceName.remove(service.name);
    } else {
      serviceName.add(service.name);
      serviceID.add(service.id);
    }

    service.isTaped.value = !service.isTaped.value;
    print("The value: ${service.isTaped.value}, ${service.name}");
    print(serviceName);
    print(serviceID);
    update();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(ApiKey.fetchTags));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        serviceList.assignAll(data.map((item) => ServiceModel.fromJson(item)));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> registerVendor(Vendor vendor, context) async {
    final String apiUrl = ApiKey.registerVendor;

    var requestBody = jsonEncode(vendor.toJson());

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 201) {
        Navigator.of(context, rootNavigator: true).pop();

        // Success - Handle the success response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData['message']);

        Get.offAll(VendorMapPage(
          number: removeLeadingZero(phoneNumber.text),
        ));
      } else if (response.statusCode == 409) {
        Navigator.of(context, rootNavigator: true).pop();

        // Vendor already exists - Handle the conflict response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData['message']);
      } else {
        Navigator.of(context, rootNavigator: true).pop();

        // Other errors - Handle the error response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(responseData['message']);
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  Future<bool> fetchVendorExistence(String number) async {
    String apiUrl = ApiKey.vednorExits + number;
    print(number);
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> data = json.decode(response.body);

        // Return the boolean value directly
        return data['result'];
      } else {
        print("Error: ${response.statusCode}");
        // Return false in case of an error
        return false;
      }
    } catch (error) {
      print("Error: $error");
      // Return false in case of an error
      return false;
    }
  }

  onSignup(String type, context) async {
    print('the image $imageUrl');
    if (vendorKey.currentState!.validate()) {
      if (serviceName.isEmpty) {
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('حدث خطأ'),
            ),
            messageText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('الرجاء اختيار الخدمات التي تقدمها '),
            ),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
        serviceIsEmpty.value = true;
      } else if (imagePath.value.isEmpty) {
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('حدث خطأ'),
            ),
            messageText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('الرجاء اختيار صورة للمركز '),
            ),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);

        imageIsEmpty.value = true;
      } else if (imageLicense.isEmpty) {
        Get.snackbar("ERROR", "Invalid Data",
            titleText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('حدث خطأ'),
            ),
            messageText: Align(
              alignment: Alignment.topRight, // Set your desired alignment
              child: searchsec('الرجاء اختيار صورة للسجل التجاري '),
            ),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
        licenseIsEmpty.value = true;
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.lightAppColors.bordercolor,
              ),
            );
          },
        );
        await uploadStoreImage();
        await uploadStoreLicence();
        // print(vendor.commercialLicense);
        print('962${removeLeadingZero(phoneNumber.text)}');
        print("the imag  $licenceUrl"); // licence
        print("the image $imageUrl"); // store img
        await registerVendor(
            Vendor(
                title: username.text,
                subtitle: subTitle.text,
                img: imageUrl,
                address: address.text,
                number: '962${removeLeadingZero(phoneNumber.text)}',
                commercialLicense: licenceUrl,
                password: password.text,
                type: type,
                tags: serviceID,
                description: description.text,
                status: 'Pending',
                id: ''),
            context);

        //  print(vendor.title);
        //  print(vendor.subtitle);
        //  print(vendor.description);
        //  print(vendor.tags);
        //  print(vendor.type);
        //  print(vendor.address);
        //  print(vendor.commercialLicense);
        //  print(vendor.img);
        //  String base64Image = await imageToBase64(vendor.img);
        //  print('Base64 Image: $base64Image');

        print(serviceID);
      }
    } else {}
    print(serviceName.isEmpty);
    print(serviceIsEmpty.value);
    update();
  }
}
