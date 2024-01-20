import 'package:flutter/material.dart';

class IntroText {
  static mainIntroText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static subIntroText(String title) {
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
}
