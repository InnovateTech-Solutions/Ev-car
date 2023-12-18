import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCompleteNumber extends StatelessWidget {
  const OtpCompleteNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'cairo-Bold',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        )),
      ),
    );
  }
}
