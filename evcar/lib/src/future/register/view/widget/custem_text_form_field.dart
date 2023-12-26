import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSave,
    this.validator,
    required this.keyboardType,
    this.isPassword = false,
  });

  final String hintText;
  final Function()? onSave;
  final Function()? validator;
  final TextInputType keyboardType;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
      child: TextFormField(
        onSaved: onSave!(),
        validator: validator!(),
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                        onTap: () {},
                        child: Icon(
                          isPassword
                              ? EvaIcons.eyeOutline
                              : EvaIcons.eyeOffOutline,
                          color: Colors.black.withOpacity(0.6),
                        )),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'cairo-Medium')),
      ),
    );
  }
}
