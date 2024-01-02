import 'package:flutter/material.dart';

class MyDividerVertical extends StatelessWidget {
  const MyDividerVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 1.0,
        height: 40.0,
        color: Colors.grey[300],
      ),
    );
  }
}
