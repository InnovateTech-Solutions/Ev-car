import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemButton extends StatelessWidget {
  const CustemButton({
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
        height: Get.height / 15,
        minWidth: Get.width / 1.11,
        color: colorButton,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppTheme.lightAppColors.buttoncolor,
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
