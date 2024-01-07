import 'package:flutter/material.dart';

class AboutText {
  static mainText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 15,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static secText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        fontFamily: 'cairo-Regular',
      ),
    );
  }

  static contactMaintText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static contactSecText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'cairo-semiBold',
      ),
    );
  }
}
