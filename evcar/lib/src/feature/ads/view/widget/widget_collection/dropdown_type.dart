import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class TypeDropDownMenuWidget extends StatelessWidget {
  const TypeDropDownMenuWidget(
      {super.key,
      required this.data,
      required this.value,
      required this.onChange});
  final data;
  final value;
  final onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.07,
      padding: EdgeInsets.only(
        right: context.screenWidth * 0.05,
      ),
      width: context.screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.lightAppColors.bordercolor),
      ),
      child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppTheme.lightAppColors.subTextcolor,
          ),
          iconSize: 24,
          elevation: 16,
          underline: SizedBox(),
          onChanged: onChange,
          items: data),
    );
  }
}
