import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/future/otp/view/widget/otp_text.dart';
import 'package:flutter/material.dart';

import 'otp_form_widget.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              OtpText.mainText('تأكيد رقم الموبايل'),
              SizedBox(
                height: 0.1 * context.screenHeight,
              ),
              OtpText.secText(
                  'لقد ارسلنا رسالة مصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك 0790973474'),
              SizedBox(
                height: 0.05 * context.screenHeight,
              ),
              SizedBox(
                height: 0.1 * context.screenHeight,
                width: 0.9 * context.screenWidth,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (BuildContext context, int index) {
                    return const OtpFormWidget();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 0.02 * context.screenWidth,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 0.04 * context.screenHeight,
              ),
              OtpText.textButton(),
              SizedBox(
                height: 0.04 * context.screenHeight,
              ),
              CustemButton(
                text: 'تأكيد',
                onPressed: () {},
                colorText: AppTheme.lightAppColors.mainTextcolor,
                colorButton: AppTheme.lightAppColors.buttoncolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
