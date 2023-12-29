import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class DetailText {
  static mainText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 23,
        fontFamily: 'cairo-Bold',
      ),
    );
  }

  static ratingText(title) {
    return Row(
      children: [
        Image.asset("assets/images/Staricon.png"),
        Text(
          title,
          style: TextStyle(
            color: AppTheme.lightAppColors.bordercolor,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  static locationText(title) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color.fromRGBO(186, 92, 61, 1),
          size: 12,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(186, 92, 61, 1),
            fontFamily: 'cairo-Medium',
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  static descriptionText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static chargeText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
