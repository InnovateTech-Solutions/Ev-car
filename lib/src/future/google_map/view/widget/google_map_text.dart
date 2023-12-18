import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mapMainText(String title) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    child: Text(title,
        textAlign: TextAlign.end,
        style: GoogleFonts.cairo(
          textStyle: TextStyle(
            color: AppTheme.lightAppColors.mainTextcolor,
            fontSize: 22,
          ),
        )),
  );
}

mapSecText(String title) {
  return Text(title,
      textAlign: TextAlign.end,
      style: GoogleFonts.cairo(
        textStyle: TextStyle(
            color: AppTheme.lightAppColors.mainTextcolor, fontSize: 15),
      ));
}

hintTextStyle() {
  return GoogleFonts.cairo(
    textStyle: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 15,
        fontWeight: FontWeight.w300),
  );
}
