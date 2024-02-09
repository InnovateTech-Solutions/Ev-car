import 'package:evcar/src/feature/login/view/widget/app_bar/login_appbar.dart';
import 'package:evcar/src/feature/vendor_login/view/widget/vendor_login_widget.dart';
import 'package:flutter/material.dart';

class VendorLoginPage extends StatelessWidget {
  const VendorLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: const AppBarLogin(), body: VendorLoginWidget()),
    );
  }
}
