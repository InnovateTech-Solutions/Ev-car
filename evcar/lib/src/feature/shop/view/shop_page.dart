import 'package:evcar/src/feature/shop/widget/main/shop_widget.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key, required this.shopModel});
  final Vendor shopModel;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ShopWidget(
        shopModel: shopModel,
      )),
    );
  }
}
