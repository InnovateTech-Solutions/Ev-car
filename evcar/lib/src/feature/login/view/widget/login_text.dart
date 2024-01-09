import 'package:flutter/material.dart';

class LoginText {
  static mainText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static secText(String title) {
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
