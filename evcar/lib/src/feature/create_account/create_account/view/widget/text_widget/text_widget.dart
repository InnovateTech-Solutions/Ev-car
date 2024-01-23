import 'package:flutter/material.dart';

class CreateAccountText {
  static mainCreateAccountText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static subCreateAccountText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        fontSize: 10,
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
