import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class ShopTypeWidget extends StatelessWidget {
  const ShopTypeWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.25,
      height: context.screenHeight * 0.03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppTheme.lightAppColors.subTextcolor)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(
          Icons.maps_home_work_outlined,
          size: 20,
        ),
        Text(title,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'cairo-Regular',
            ))
      ]),
    );
  }
}
