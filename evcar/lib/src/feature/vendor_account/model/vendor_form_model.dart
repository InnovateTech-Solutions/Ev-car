import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VendorFormModel {
  TextEditingController controller = TextEditingController();
  String hintText;
  bool invisible;
  bool enableText;
  Widget? icon;
  VoidCallback? onTap;
  TextAlign? textAligment;
  final String? Function(String?)? validator;
  TextInputType type;
  List<TextInputFormatter>? inputFormat;

  VendorFormModel(
      {required this.controller,
      required this.enableText,
      this.icon,
      this.textAligment,
      required this.hintText,
      required this.invisible,
      required this.validator,
      required this.type,
      required this.inputFormat,
      required this.onTap});
}
