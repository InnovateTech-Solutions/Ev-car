import 'package:flutter/material.dart';

class PortableChargerText {
  static mainText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'cairo-Bold',
        fontSize: 18,
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'cairo-Bold',
        fontSize: 16,
      ),
    );
  }

  static thirdText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
