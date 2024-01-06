import 'package:evcar/src/config/theme/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class OtpFormWidget extends StatelessWidget {
  OtpFormWidget({required this.controller, super.key});

  late var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.7 * context.screenHeight,
      width: 0.15 * context.screenWidth,
      child: TextFormField(
        controller: controller,
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
