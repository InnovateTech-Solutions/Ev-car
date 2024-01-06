import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  FormWidget({
    required this.formModel,
    this.ontap,
    super.key,
  });
  FormModel formModel;
  VoidCallback? ontap;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0.01 * screenWidth)),
          ),
          child: TextFormField(
              cursorColor: AppTheme.lightAppColors.primary,
              style: TextStyle(color: AppTheme.lightAppColors.primary),
              readOnly: widget.formModel.enableText,
              inputFormatters: widget.formModel.inputFormat,
              keyboardType: widget.formModel.type,
              validator: widget.formModel.validator,
              obscureText: widget.formModel.invisible,
              controller: widget.formModel.controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: widget.ontap,
                    icon: Icon(widget.formModel.icon),
                  ),
                  filled: true,
                  fillColor: AppTheme.lightAppColors.background,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.03 * screenWidth))),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.03 * screenWidth))),
                  hintText: widget.formModel.hintText,
                  hintStyle: TextStyle(
                      fontFamily: 'cairo-Regular',
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 17)))),
    );
  }
}
