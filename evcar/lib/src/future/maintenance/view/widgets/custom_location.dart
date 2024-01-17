import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Styles.textstyle14(
          text,
          const Color.fromRGBO(186, 92, 61, 1),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        const Icon(
          Icons.place_rounded,
          size: 20,
          color: Color.fromRGBO(186, 92, 61, 1),
        ),
      ],
    );
  }
}
