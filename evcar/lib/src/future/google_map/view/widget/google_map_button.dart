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
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.37 * screenWidth,
        height: 0.11 * screenWidth,
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.lightAppColors.buttoncolor),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: color),
        child: Center(
          child: Text(title,
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
