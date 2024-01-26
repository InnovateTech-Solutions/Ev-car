import 'package:evcar/src/feature/login/view/widget/app_bar/login_appbar.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/main_widget/vendor_register_widget.dart';
import 'package:flutter/material.dart';

class VendorRegisterPage extends StatelessWidget {
  const VendorRegisterPage({required this.type, super.key});
  final String type;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarLogin(),
        body: VendorRegisterWidget(
          type: type,
        ),
      ),
    );
  }
}
