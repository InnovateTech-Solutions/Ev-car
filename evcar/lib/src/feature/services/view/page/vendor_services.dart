import 'package:evcar/src/feature/basic_info/view/widget/basic_info_appbar.dart';
import 'package:evcar/src/feature/services/view/widget/main/vendor_services_widget.dart';
import 'package:flutter/material.dart';

class VendorServicesPage extends StatelessWidget {
  const VendorServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicInfoAppBar.appBar(),
        body: VendorServicesWidget(),
      ),
    );
  }
}
