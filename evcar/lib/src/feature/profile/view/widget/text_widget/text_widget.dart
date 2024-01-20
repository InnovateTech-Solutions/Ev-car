import 'package:flutter/material.dart';

abstract class Styles {
  static Text textstyle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text rating(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
    );
  }

  static Text location(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromRGBO(186, 92, 61, 1),
        fontFamily: 'cairo-Medium',
        fontSize: 12,
      ),
    );
  }

  static Text details(String title) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle30(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static Text textstyle22(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static Text textstyle19(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 19.3,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo-Regular',
      ),
    );
  }

  static Text textstyle18(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }

  static Text textstyle17(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle16(String title) {
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

  static Text textstyle12(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromRGBO(134, 134, 134, 1),
        fontSize: 12.86,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }
}
