import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/about/widget/about_text.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutText.contactMaintText("اتصل بنا"),
          AboutText.contactSecText(
              "نحن هنا لدعمك والاستماع إلى استفساراتك واقتراحاتك. لا تتردد في الاتصال بنا لأي سؤال أو توضيح. يمكنك الاتصال بفريق الدعم الخاص بنا عبر الطرق التالية:"),
          SizedBox(
            height: 0.02 * context.screenHeight,
          ),
          AboutText.contactSecText(
              "البريد الإلكتروني\nللأسئلة العامة والدعم الفني:\n muslllam.al-absi@outlook.com"),
          SizedBox(
            height: 0.02 * context.screenHeight,
          ),
          AboutText.contactSecText(
              "خدمة العملاء\nخدمة العملاء متاحة يوميًا على مدار الساعة. للتواصل مباشرة، اتصل بنا على الرقم: \n00962799393483"),
        ],
      ),
    );
  }
}
