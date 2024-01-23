import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/product/widget/main_widget/product_widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productModel});
  final PartsModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ProductWidget(
        productModel: productModel,
      )),
    );
  }
}
