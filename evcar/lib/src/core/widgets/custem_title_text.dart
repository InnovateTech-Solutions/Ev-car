import 'package:flutter/material.dart';

class CustemTitleText extends StatelessWidget {
  const CustemTitleText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontFamily: 'cairo-Bold',
      ),
    );
  }
}
