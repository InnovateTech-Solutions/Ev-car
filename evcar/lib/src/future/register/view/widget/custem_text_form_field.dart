import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onSaved: widget.onSave!(),
        validator: widget.validator!(),
        keyboardType: widget.keyboardType,
        obscureText: !showPassword,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword
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
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontFamily: 'cairo-Medium')),
      ),
    );
  }
}
