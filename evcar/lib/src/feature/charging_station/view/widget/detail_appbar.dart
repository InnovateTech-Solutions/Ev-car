import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

detailAppBar(String title) {
  return AppBar(
    leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppTheme.lightAppColors.primary,
        )),
    backgroundColor: AppTheme.lightAppColors.background,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    title: Text(title,
        style: TextStyle(
            fontFamily: 'cairo-SemiBold',
            fontSize: 25,
            color: AppTheme.lightAppColors.primary)),
  );
}
