import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/core/widgets/custem_title_text.dart';
import 'package:evcar/src/future/login/view/widget/custem_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_title_text2.dart';
import 'otp_complete_number.dart';

class CompletePhoneWidget extends StatelessWidget {
  const CompletePhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        right: 10,
        left: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustemTitleText(text: 'تأكيد رقم الموبايل'),
            SizedBox(
              height: Get.height / 15,
            ),
            const CustomTitleText2(
                text:
                    'لقد ارسلنا رسالة مصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك 0790973474'),
            SizedBox(
              height: Get.height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const OtpCompleteNumber(),
                SizedBox(
                  width: Get.width / 40,
                ),
                const OtpCompleteNumber(),
                SizedBox(
                  width: Get.width / 40,
                ),
                const OtpCompleteNumber(),
                SizedBox(
                  width: Get.width / 40,
                ),
                const OtpCompleteNumber(),
                SizedBox(
                  width: Get.width / 40,
                ),
                const OtpCompleteNumber(),
              ],
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            Row(
              children: [
                const CustomTitleText2(text: 'لم أتلق الرمز'),
                TextButton(
                  onPressed: () {},
                  child: const CustemText(
                    text: 'إعادة أرسال',
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            CustemButton(
              text: 'تأكيد',
              onPressed: () {},
              colorText: Colors.white,
              colorButton: const Color.fromRGBO(0, 168, 168, 1),
            )
          ],
        ),
      ),
    );
  }
}
