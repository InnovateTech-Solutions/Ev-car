import 'package:flutter/material.dart';

class CustomTextDescription extends StatelessWidget {
  const CustomTextDescription({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontFamily: 'cairo-Medium',
      ),
    );
  }
}
