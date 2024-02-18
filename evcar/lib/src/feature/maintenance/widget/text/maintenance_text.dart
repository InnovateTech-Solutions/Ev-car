import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class MaintenanceText {
  static appBarMainText(String title) {
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

  static appBarSecText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static seeMore(title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo-bold',
            ),
          ),
          const Spacer(),
          Text(
            'المزيد',
            style: TextStyle(
              color: AppTheme.lightAppColors.buttoncolor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo-Medium',
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.lightAppColors.buttoncolor,
            size: 14,
          ),
        ],
      ),
    );
  }

  static serviceText(title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }

  static shopMainText(
    title,
  ) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo-Medium',
      ),
    );
  }

  static shopSecText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 10,
        fontFamily: 'cairo-Regular',
      ),
    );
  }

  static addressText(title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromRGBO(186, 92, 61, 1),
        fontFamily: 'cairo-Bold',
        fontSize: 12,
      ),
    );
  }

  static orderMainText(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'cairo-Medium',
      ),
    );
  }

  static orderSecText(title) {
    return Text(
      title,
      style: TextStyle(
        color: AppTheme.lightAppColors.subTextcolor,
        fontSize: 12,
        fontFamily: 'cairo-Regular',
      ),
    );
  }

  static orderPriceText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xffFE5757),
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
