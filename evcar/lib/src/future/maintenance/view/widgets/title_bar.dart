import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Styles.textstyle22bold(text),
        const Spacer(),
        Styles.textstyle12(
          'المزيد',
          const Color.fromRGBO(0, 168, 168, 1),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .01,
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(0, 168, 168, 1),
          size: 14,
        ),
      ],
    );
  }
}
