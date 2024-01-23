import 'package:flutter/material.dart';

class TextWidget {
  static mainVendorText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static subVendorText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontFamily: 'cairo-Regular',
        color: Color(0xff000000),
      ),
    );
  }
}
