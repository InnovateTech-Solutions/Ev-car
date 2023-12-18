import 'package:flutter/material.dart';

class CustemFavriteIcon extends StatelessWidget {
  const CustemFavriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: const Image(
          image: AssetImage('assets/images/favriteicon.png'),
        ),
      ),
    );
  }
}
