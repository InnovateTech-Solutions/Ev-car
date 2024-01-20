import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterText {
  static mainText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static textButton() {
    return Text.rich(TextSpan(
        text: 'من خلال إنشاء حساب أو الدخول فإنك توافق على  ',
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'cairo-Regular',
        ),
        children: [
          TextSpan(
            text: 'الشروط والأحكام الخاصة بنا ',
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'cairo-SemiBold',
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          )
        ]));
  }
}
