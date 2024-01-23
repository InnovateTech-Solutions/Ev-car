import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_appbar.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_image.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_phone_button.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/similar_widget.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productModel});
  final PartsModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.02,
          horizontal: context.screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductAppBar(),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          ProductImageSlider(),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Row(
            children: [
              ProductText.mainProductText(productModel.title, Colors.black),
              const Spacer(),
              ProductText.productPriceText(
                productModel.price,
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          ProductText.secProductText(
            productModel.vendor,
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          ProductText.productAddressText(
            productModel.vendorAddress,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          ProductPhoneButton(
            phone: productModel.phone,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          ProductText.productDescriptionText(
            "توصيل مجاني وتركيب في اي مكان",
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.06),
          ProductText.headerText("قطع متشابهة"),
          SimilarWidget()
        ]),
      ),
    );
  }
}
