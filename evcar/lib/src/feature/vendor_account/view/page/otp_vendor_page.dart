import 'package:evcar/src/feature/login/view/widget/app_bar/login_appbar.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/main_widget/otp_vendor_widget.dart';
import 'package:flutter/material.dart';

class OTPVendorPage extends StatelessWidget {
  const OTPVendorPage({required this.number, super.key});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLogin(),
      body: VendorOTPwidget(number: number),
    );
  }
}
