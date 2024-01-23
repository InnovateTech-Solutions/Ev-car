// ignore: must_be_immutable
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/vendor_account/model/vendor_form_model.dart';
import 'package:flutter/material.dart';

class VendorFormWidget extends StatefulWidget {
  VendorFormWidget({
    required this.vendorFormModel,
    this.ontap,
    super.key,
  });
  VendorFormModel vendorFormModel;
  VoidCallback? ontap;

  @override
  State<VendorFormWidget> createState() => _VendorFormWidgetState();
}

class _VendorFormWidgetState extends State<VendorFormWidget> {
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
              readOnly: widget.vendorFormModel.enableText,
              inputFormatters: widget.vendorFormModel.inputFormat,
              keyboardType: widget.vendorFormModel.type,
              validator: widget.vendorFormModel.validator,
              obscureText: widget.vendorFormModel.invisible,
              controller: widget.vendorFormModel.controller,
              decoration: InputDecoration(
                  suffixIcon: widget,
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
                  hintText: widget.vendorFormModel.hintText,
                  hintStyle: TextStyle(
                      fontFamily: 'cairo-Regular',
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 17)))),
    );
  }
}