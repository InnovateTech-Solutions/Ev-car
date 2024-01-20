import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginText {
  static mainLoginText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static subLoginText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        fontSize: 16,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  validationLoginText(String title) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'cairo-Regular',
          color: AppTheme.lightAppColors.mainTextcolor,
          fontSize: 12),
    );
  }

  static forgetPassword(String title, VoidCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          fontSize: 16,
          fontFamily: 'cairo-Medium',
        ),
      ),
    );
  }
}
