import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onTap,
      required this.title,
      required this.color});
  final String title;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.37 * context.screenWidth,
        height: 0.05 * context.screenHeight,
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.lightAppColors.buttoncolor),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: color),
        child: Center(
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'cairo-Regular',
                  color: color == AppTheme.lightAppColors.buttoncolor
                      ? AppTheme.lightAppColors.mainTextcolor
                      : AppTheme.lightAppColors.buttoncolor)),
        ),
      ),
    );
  }
}
