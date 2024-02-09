import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInfoAppBar {
  static appBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          )),
      scrolledUnderElevation: 0,
      backgroundColor: AppTheme.lightAppColors.background,
      elevation: 0,
    );
  }
}
