import 'package:flutter/material.dart';

class CustemButtonMessage extends StatelessWidget {
  const CustemButtonMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Image(
        image: AssetImage('assets/images/iconmessage.png'),
      ),
    );
  }
}
