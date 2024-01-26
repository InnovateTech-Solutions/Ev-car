import 'package:flutter/material.dart';

class CustomItemOfCarShowWidget extends StatelessWidget {
  const CustomItemOfCarShowWidget({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width * .3,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
