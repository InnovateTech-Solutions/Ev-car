import 'package:flutter/material.dart';

class CustomTextFormAdsWidget extends StatelessWidget {
  const CustomTextFormAdsWidget({
    super.key,
    required this.text,
    this.num = 100,
    required this.value,
  });

  final String text;
  final int? num;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(218, 218, 218, 1),
            spreadRadius: -3,
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        maxLength: num,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(value),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          hintStyle: const TextStyle(
            fontFamily: 'cairo-Medium',
          ),
        ),
      ),
    );
  }
}
