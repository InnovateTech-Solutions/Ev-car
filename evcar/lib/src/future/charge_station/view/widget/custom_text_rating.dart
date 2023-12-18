import 'package:flutter/material.dart';

class CustomTextRating extends StatelessWidget {
  const CustomTextRating({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Text(
      rating,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
    );
  }
}
