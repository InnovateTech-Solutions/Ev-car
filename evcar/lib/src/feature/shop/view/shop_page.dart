import 'package:evcar/src/feature/shop/model/shop_model.dart';
import 'package:evcar/src/feature/shop/widget/shop_widget.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key, required this.shopModel});
  final ShopModel shopModel;
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
