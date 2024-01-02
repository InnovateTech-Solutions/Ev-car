import 'package:flutter/material.dart';

import '../widget/text_widget/text_widget.dart';

class CustomDetailsOfPlace extends StatelessWidget {
  const CustomDetailsOfPlace(
      {super.key, required this.text, required this.rating});
  final String text;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Styles.textstyle25(text),
        const Spacer(),
        const Image(
          image: AssetImage(
            'assets/images/Staricon.png',
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 55,
        ),
        Styles.rating(rating),
      ],
    );
  }
}
