import 'package:flutter/material.dart';

class CustemTextTitle extends StatelessWidget {
  const CustemTextTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'cairo-Bold',
        fontSize: 18,
      ),
    );
  }
}
