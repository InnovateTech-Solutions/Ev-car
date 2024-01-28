import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdsFormWidget extends StatefulWidget {
  AdsFormWidget({
    required this.formModel,
    this.ontap,
    this.name,
    super.key,
  });
  FormModel formModel;
  VoidCallback? ontap;
  String? name;

  @override
  State<AdsFormWidget> createState() => _AdsFormWidgetState();
}

class _AdsFormWidgetState extends State<AdsFormWidget> {
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
                maxLines: widget.name == "وصف الاعلان " ? 5 : 1,
                cursorColor: AppTheme.lightAppColors.primary,
                style: TextStyle(
                  color: AppTheme.lightAppColors.subTextcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'cairo-Bold',
                ),
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
                        color: AppTheme.lightAppColors.bordercolor,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.03 * context.screenWidth))),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.lightAppColors.bordercolor,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.03 * context.screenWidth))),
                  hintText: widget.formModel.hintText,
                  hintStyle: TextStyle(
                    color: AppTheme.lightAppColors.subTextcolor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'cairo-Bold',
                  ),
                )),
          )),
    );
  }
}
