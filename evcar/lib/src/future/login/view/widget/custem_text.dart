import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  const CustemText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
