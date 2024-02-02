import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

splashMainText(String title) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    child: Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.lightAppColors.mainTextcolor,
          fontSize: 30,
        )),
  );
}

mainText(String title) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    child: Text(title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppTheme.lightAppColors.mainTextcolor,
          fontSize: 30,
        )),
  );
}

splashSecText(String title) {
  return Text(
    title,
    textAlign: TextAlign.start,
    style:
        TextStyle(color: AppTheme.lightAppColors.mainTextcolor, fontSize: 14),
  );
}

secText(String title) {
  return Text(
    title,
    textAlign: TextAlign.start,
    style:
        TextStyle(color: AppTheme.lightAppColors.mainTextcolor, fontSize: 14),
  );
}

thirdText(String title) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    child: Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: AppTheme.lightAppColors.mainTextcolor,
          fontSize: 20,
          fontWeight: FontWeight.w300),
    ),
  );
}

Text blueText(String title) {
  return Text(title,
      style:
          TextStyle(color: AppTheme.lightAppColors.buttoncolor, fontSize: 40));
}
