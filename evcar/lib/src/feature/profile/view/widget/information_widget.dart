import 'package:evcar/src/feature/profile/view/widget/text_form_profile.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custem_button.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        const TextFormProfile(
          label: 'الاسم',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        const TextFormProfile(
          label: 'رقم الهاتف',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        const TextFormProfile(
          label: 'نوع السيارة',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .08,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: CustemButton(
                  onPressed: () {},
                  text: 'تعديل',
                  colorText: Colors.white,
                  colorButton: const Color.fromRGBO(0, 168, 168, 1),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.02,
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: CustemButton(
                  onPressed: () {},
                  text: 'تعديل',
                  colorText: const Color.fromRGBO(0, 168, 168, 1),
                  colorButton: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}