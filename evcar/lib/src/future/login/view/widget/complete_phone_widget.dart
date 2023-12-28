import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import 'otp_complete_number.dart';

class CompletePhoneWidget extends StatelessWidget {
  const CompletePhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .07,
        right: MediaQuery.of(context).size.width * .03,
        left: MediaQuery.of(context).size.width * .03,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const CustemTitleText(text: 'تأكيد رقم الموبايل'),
            Styles.textstyle30('تأكيد رقم الموبايل'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            // const CustomTitleText2(
            //     text:
            //         'لقد ارسلنا رسالة مصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك 0790973474'),
            Styles.textstyle16(
                'لقد ارسلنا رسالة مصية قصيرة تحتوي على رمز\n  التفعيل إلى هاتفك 0790973474'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const OtpCompleteNumber(),
                SizedBox(
                  width: MediaQuery.of(context).size.height * .01,
                ),
                const OtpCompleteNumber(),
                SizedBox(
                  width: MediaQuery.of(context).size.height * .01,
                ),
                const OtpCompleteNumber(),
                SizedBox(
                  width: MediaQuery.of(context).size.height * .01,
                ),
                const OtpCompleteNumber(),
                SizedBox(
                  width: MediaQuery.of(context).size.height * .01,
                ),
                const OtpCompleteNumber(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const CustomTitleText2(text: 'لم أتلق الرمز'),
                Styles.textstyle16('لم أتلق الرمز'),
                TextButton(
                    onPressed: () {}, child: Styles.textstyle17('إعادة أرسال')
                    // const CustemText(
                    //   text: 'إعادة أرسال',
                    // ),
                    )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
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
