import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class CustemButtonCall extends StatelessWidget {
  const CustemButtonCall({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0.35 * MediaQuery.of(context).size.width,
      height: 0.05 * MediaQuery.of(context).size.height,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      color: AppTheme.lightAppColors.buttoncolor,
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.lightAppColors.mainTextcolor,
          fontFamily: 'cairo-Medium',
        ),
      ),
    );
  }
}
