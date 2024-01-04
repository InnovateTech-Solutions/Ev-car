import 'package:flutter/material.dart';

import 'custem_button_call.dart';
import 'custem_button_message.dart';

class CustemIcons extends StatelessWidget {
  const CustemIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustemButtonCall(text: 'اتصل الان'),
        SizedBox(
          width: MediaQuery.of(context).size.width / 50,
        ),
        CustemButtonMessage(),
      ],
    );
  }
}