import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsAppBar {
  static appBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
          )),
      scrolledUnderElevation: 0,
      backgroundColor: AppTheme.lightAppColors.background,
      elevation: 0,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                ))
          ],
        )
      ],
    );
  }
}
