import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class IntroPageButton extends StatelessWidget {
  const IntroPageButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.colorText,
    required this.colorButton,
  });

  final String text;
  final Function()? onPressed;
  final Color colorText;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        height: context.screenHeight / 15,
        minWidth: context.screenWidth / 1.11,
        color: colorButton,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorButton == AppTheme.lightAppColors.bordercolor
                ? AppTheme.lightAppColors.buttoncolor
                : AppTheme.lightAppColors.buttoncolor,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 17.5,
            fontFamily: 'cairo-Medium',
          ),
        ));
  }
}
