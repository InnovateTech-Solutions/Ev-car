import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class AdsText {
  static mainText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppTheme.lightAppColors.bordercolor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static menuText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppTheme.lightAppColors.subTextcolor,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'cairo-Bold',
      ),
    );
  }
}
