import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  return GoogleFonts.cairo(
    textStyle: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 15,
        fontWeight: FontWeight.w300),
  );
}

infoWindoMainText(String title) {
  return Text(title,
      style: GoogleFonts.cairo(
        textStyle: const TextStyle(fontSize: 14),
      ));
}

infoWindoSecText(String title, VoidCallback onTap) {
  return TextButton(
      onPressed: onTap,
      child: Text(title,
          style: GoogleFonts.cairo(
              textStyle: const TextStyle(fontSize: 14),
              color: AppTheme.lightAppColors.buttoncolor)));
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
