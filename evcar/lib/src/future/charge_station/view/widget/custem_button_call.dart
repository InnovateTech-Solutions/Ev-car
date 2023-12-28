import 'package:flutter/material.dart';

class CustemButtonCall extends StatelessWidget {
  const CustemButtonCall({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 30,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide.none,
      ),
      color: const Color.fromRGBO(0, 168, 168, 1),
      onPressed: () {},
      child: const Text(
        'اتصل الان',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'cairo-Medium',
        ),
      ),
    );
  }
}
