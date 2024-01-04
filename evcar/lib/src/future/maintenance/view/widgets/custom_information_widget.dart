import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';

class CustomInformationWidget extends StatelessWidget {
  const CustomInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .02,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.textstyle14('صباح الخير,', Colors.black),
            Styles.textstyle19('مسلم العبسي'),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage('assets/images/heart-circle.png'),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .03,
        ),
        InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage('assets/images/notification.png'),
          ),
        ),
      ],
    );
  }
}
