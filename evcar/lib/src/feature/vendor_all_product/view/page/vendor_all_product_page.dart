import 'package:evcar/src/feature/basic_info/view/widget/basic_info_appbar.dart';
import 'package:evcar/src/feature/vendor_all_product/view/widget/main/vendor_all_product_widget.dart';
import 'package:flutter/material.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicInfoAppBar.appBar(),
        body: VendorAllProductWidget(),
      ),
    );
  }
}
