import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class ProductText {
  static mainProductText(title, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }

  static productPriceText(title) {
    return Text(
      title,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        overflow: TextOverflow.ellipsis,
        fontSize: 28,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static secProductText(title) {
    return Text(
      title,
      style: TextStyle(
        color: AppTheme.lightAppColors.subTextcolor,
        fontSize: 17,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static thirdProductText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.5,
        fontWeight: FontWeight.w600,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static productAddressText(title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xffBA5C3D),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'cairo-Medium',
          ),
        ),
        Icon(
          Icons.location_on,
          color: Color(0xffBA5C3D),
        ),
      ],
    );
  }

  static productDescriptionText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'cairo-Regular',
      ),
    );
  }

  static similarMainText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12.86,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }

  static headerText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.50,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo-Bold',
      ),
    );
  }

  static similarSecText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 10,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static similarThirdText(title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFFE31837),
        fontSize: 16,
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
