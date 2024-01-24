import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';

class CustomCartProfile extends StatelessWidget {
  const CustomCartProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .12,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .06,
          vertical: MediaQuery.of(context).size.height * .02,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffDFDFDF),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .04),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Styles.textstyle19('مسلم العبسي'),
                  Styles.textstyle12(
                      'معلومات الحساب', const Color.fromRGBO(134, 134, 134, 1)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}