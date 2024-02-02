import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

mapMainText(String title) {
  return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "cairo-Regular",
          color: AppTheme.lightAppColors.mainTextcolor,
          fontSize: 22,
        ),
      ));
}

mapSecText(String title) {
  return Text(
    title,
    style: TextStyle(
        fontFamily: 'cairo-Regular',
        color: AppTheme.lightAppColors.mainTextcolor,
        fontSize: 15),
  );
}

hintTextStyle() {
  return TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontSize: 15,
      fontWeight: FontWeight.w300);
}

infoWindoMainText(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 14),
  );
}

infoWindoSecText(String title, VoidCallback onTap) {
  return TextButton(
    onPressed: onTap,
    child: Text(title,
        style: TextStyle(
            fontSize: 14, color: AppTheme.lightAppColors.buttoncolor)),
  );
}

searchsec(String title) {
  return Text(
    title,
    style: TextStyle(
        fontFamily: 'cairo-Regular',
        color: AppTheme.lightAppColors.mainTextcolor,
        fontSize: 12),
  );
}
