import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/otp/view/widget/text_widget/otp_text.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/theme.dart';

userExistDialog(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppTheme.lightAppColors.buttoncolor,
        content: SizedBox(
            height: 0.2 * context.screenHeight,
            width: context.screenWidth * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.highlight_remove_sharp,
                  color: AppTheme.lightAppColors.background,
                  size: 0.2 * context.screenWidth,
                ),
                SizedBox(
                  height: 0.03 * context.screenWidth,
                ),
                OtpText.theridext(title)
              ],
            )),
      );
    },
  );
}
