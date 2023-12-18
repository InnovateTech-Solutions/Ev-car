import 'package:flutter/material.dart';

class CustomTitleText2 extends StatelessWidget {
  const CustomTitleText2({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        fontSize: 16,
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
