import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class VendorDashboardText {
  static buttonText(title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppTheme.lightAppColors.mainTextcolor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-Regular',
      ),
    );
  }
}
