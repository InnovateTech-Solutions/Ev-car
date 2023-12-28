import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../../../core/widgets/dividerHorizontal.dart';
import '../../../../core/widgets/dividerVertical.dart';
import '../pages/complete_phone.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.textstyle30('تسجيل الدخول'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Styles.textstyle16(
                'يرجى تأكيد رمز البلد الخاص بك وإدخال رقم هاتفك.'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            const MyDividerHorizontal(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
              child: Styles.textstyle17('الاردن'),
            ),
            const MyDividerHorizontal(),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: '00 00 00 00 0',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'cairo-Medium',
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const MyDividerVertical(),
                Styles.textstyle17('962+'),
              ],
            ),
            const MyDividerHorizontal(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            CustemButton(
              text: 'التالي',
              onPressed: () {
                Get.to(const CompletePhone());
              },
              colorText: Colors.white,
              colorButton: const Color.fromRGBO(0, 168, 168, 1),
            )
          ],
        ),
      ),
    );
  }
}
