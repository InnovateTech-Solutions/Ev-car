import 'package:evcar/src/future/register/model/form_model.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key, required this.formModel});
  final FormModel formModel;
  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.formModel.controller,
      readOnly: widget.formModel.enableText,
      textAlign: TextAlign.end,
      inputFormatters: widget.formModel.inputFormat,
      keyboardType: widget.formModel.type,
      validator: widget.formModel.validator,
      decoration: InputDecoration(
        hintText: widget.formModel.hintText,
        border: InputBorder.none,
      ),
    );
  }
}
