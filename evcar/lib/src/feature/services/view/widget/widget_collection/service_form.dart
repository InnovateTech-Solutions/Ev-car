import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key, required this.formModel});
  final FormModel formModel;
  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(0.01 * context.screenWidth)),
          ),
          child: Center(
            child: TextFormField(
                maxLines: 5,
                cursorColor: AppTheme.lightAppColors.primary,
                style: TextStyle(
                  color: AppTheme.lightAppColors.subTextcolor,
                  fontSize: 18,
                  fontFamily: 'cairo-Regular',
                ),
                readOnly: widget.formModel.enableText,
                inputFormatters: widget.formModel.inputFormat,
                keyboardType: widget.formModel.type,
                validator: widget.formModel.validator,
                obscureText: widget.formModel.invisible,
                controller: widget.formModel.controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppTheme.lightAppColors.background,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.03 * context.screenWidth))),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.03 * context.screenWidth))),
                  hintText: widget.formModel.hintText,
                  hintStyle: TextStyle(
                    color: AppTheme.lightAppColors.subTextcolor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: 'cairo-Regular',
                  ),
                )),
          )),
    );
  }
}
