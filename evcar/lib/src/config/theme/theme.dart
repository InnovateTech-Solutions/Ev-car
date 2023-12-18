import 'package:evcar/src/config/theme/app_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff161E21),
    background: const Color(0xffFFFFFF),
    buttoncolor: const Color(0xff00A8A8),
    bordercolor: const Color(0xffD9D9D9),
    subTextcolor: const Color(0xffA9A9A9),
    mainTextcolor: const Color(0xffFFFFFF),
  );
}
