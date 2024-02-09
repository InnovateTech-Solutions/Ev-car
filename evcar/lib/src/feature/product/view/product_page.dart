import 'package:evcar/src/feature/product/widget/main_widget/product_widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ProductWidget(
        productId: productId,
      )),
    );
  }
}
