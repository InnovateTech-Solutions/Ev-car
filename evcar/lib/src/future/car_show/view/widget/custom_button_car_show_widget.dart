import 'package:flutter/material.dart';

class CustemButtonCarShowWidget extends StatelessWidget {
  const CustemButtonCarShowWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.colorText,
    required this.colorButton,
  });

  final String text;
  final Function()? onPressed;
  final Color colorText;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        height: MediaQuery.of(context).size.height * .04,
        minWidth: MediaQuery.of(context).size.width * .23,
        color: colorButton,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 168, 168, 1),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 12,
            fontFamily: 'cairo-Medium',
          ),
        ));
  }
}
