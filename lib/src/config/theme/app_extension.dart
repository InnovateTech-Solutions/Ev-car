import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension(
      {required this.primary,
      required this.background,
      required this.buttoncolor,
      required this.bordercolor,
      required this.mainTextcolor,
      required this.subTextcolor});

  final Color primary;
  final Color background;
  final Color buttoncolor;
  final Color bordercolor;
  final Color subTextcolor;
  final Color mainTextcolor;

  @override
  ThemeExtension<AppColorsExtension> copyWith(
      {Color? primary,
      Color? background,
      Color? buttoncolor,
      Color? bordercolor,
      Color? subTextcolor,
      Color? mainTextcolor}) {
    return AppColorsExtension(
        primary: primary ?? this.primary,
        background: background ?? this.background,
        buttoncolor: buttoncolor ?? this.buttoncolor,
        bordercolor: bordercolor ?? this.bordercolor,
        subTextcolor: subTextcolor ?? this.subTextcolor,
        mainTextcolor: mainTextcolor ?? this.mainTextcolor);
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      buttoncolor: Color.lerp(buttoncolor, other.buttoncolor, t)!,
      bordercolor: Color.lerp(bordercolor, other.bordercolor, t)!,
      mainTextcolor: Color.lerp(mainTextcolor, other.mainTextcolor, t)!,
      subTextcolor: Color.lerp(subTextcolor, other.subTextcolor, t)!,
    );
  }
}
