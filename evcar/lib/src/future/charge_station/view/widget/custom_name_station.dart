import 'package:flutter/material.dart';

class CustemNameStation extends StatelessWidget {
  const CustemNameStation({super.key, required this.nameStation});

  final String nameStation;
  @override
  Widget build(BuildContext context) {
    return Text(
      nameStation,
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'cairo-Bold',
      ),
    );
  }
}
