import 'package:flutter/material.dart';

abstract class Styles {
  static String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return "${text.substring(0, maxLength)}..";
    }
  }

  static Text textstyle(String title, Color color) {
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
        color: color,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle10(String title, Color color) {
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
        fontSize: 10,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text rating(String title) {
    return Text(
      title,
      maxLines: 2,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Colors.grey,
        fontSize: 20,
      ),
    );
  }

  static Text location(String title) {
    return Text(
      title,
      maxLines: 2,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
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
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle30(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 2,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static Text textstyle28(String title, Color color) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        overflow: TextOverflow.ellipsis,
        fontSize: 28,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle25(String title) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 25.9,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle22(String title, {int maxLength = 20}) {
    if (title.length <= maxLength) {
      return Text(
        title,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          fontFamily: 'Cairo-Medium',
        ),
      );
    } else {
      String modifiedText = '';
      for (int i = 0; i < title.length; i += maxLength) {
        modifiedText += '${title.substring(i, i + maxLength)}\n';
      }
      return Text(
        modifiedText.trim(), // Remove trailing newline
        maxLines: null, // Allow multiple lines
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          fontFamily: 'Cairo-Medium',
        ),
      );
    }
  }

  static Text textstyle22bold(String title) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-bold',
      ),
    );
  }

  static Text textstyle19(String title) {
    return Text(
      title,
      maxLines: 2,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
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
        overflow: TextOverflow.ellipsis,
        color: Color.fromRGBO(0, 0, 0, 1),
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }

  static Text textstyle17(String title, Color color) {
    String truncated = truncateString(title, 10);
    return Text(
      truncated,
      textAlign: TextAlign.center,
      maxLines: 1,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: 17,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle16(String title, Color color) {
    return Text(
      title,
      textAlign: TextAlign.start,
      maxLines: 2,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: 16,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle14(String title, Color color) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: 14,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static Text textstyle12(String title, Color color) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: 12.86,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }
}
