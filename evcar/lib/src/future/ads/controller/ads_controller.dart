import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AdsController extends GetxController {
  RxBool isDeliverySelected = false.obs;
  Rx<Color> buttonColor = Colors.grey.obs;
}
