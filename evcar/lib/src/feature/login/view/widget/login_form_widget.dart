import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
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
      obscureText: widget.formModel.invisible,
      controller: widget.formModel.controller,
      readOnly: widget.formModel.enableText,
      textAlign: widget.formModel.textAligment!,
      inputFormatters: widget.formModel.inputFormat,
      keyboardType: widget.formModel.type,
      validator: widget.formModel.validator,
      decoration: InputDecoration(
        hintText: widget.formModel.hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.lightAppColors.bordercolor),
        ),
        // Add UnderlineInputBorder here
        hintStyle: TextStyle(
          fontFamily: 'cairo-Regular',
          color: Colors.black.withOpacity(0.5),
          fontSize: 17,
        ),
      ),
    );
  }
}
