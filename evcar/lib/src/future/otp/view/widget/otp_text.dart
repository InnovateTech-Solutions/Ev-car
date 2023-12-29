import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpText {
  static mainText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 32,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 17.5,
        fontFamily: 'cairo-Regular',
      ),
    );
  }

  static textButton() {
    return Text.rich(TextSpan(
        text: 'لم أتلق الرمز ',
        style: const TextStyle(
          fontSize: 17,
          fontFamily: 'cairo-Regular',
        ),
        children: [
          TextSpan(
            text: 'إعادة إرسال',
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'cairo-SemiBold',
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          )
        ]));
  }
}
