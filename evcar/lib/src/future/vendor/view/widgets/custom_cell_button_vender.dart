import 'package:flutter/material.dart';

class CustomCallBottunVendor extends StatelessWidget {
  const CustomCallBottunVendor({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .05,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      color: const Color.fromRGBO(0, 204, 204, 1),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'cairo-Medium',
        ),
      ),
    );
  }
}
