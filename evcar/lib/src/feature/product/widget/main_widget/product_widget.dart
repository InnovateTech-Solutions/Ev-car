import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/product/controller/product_controller.dart';
import 'package:evcar/src/feature/product/model/product_detail_model.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_appbar.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_image.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_phone_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return FutureBuilder<ProductDetails>(
      future: controller.fetchProductById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final productData = snapshot.data!;

          return Container(
            margin: EdgeInsets.symmetric(
              vertical: context.screenHeight * 0.02,
              horizontal: context.screenWidth * 0.05,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductAppBar(),
                  SizedBox(height: context.screenHeight * 0.01),
                  ProductImageSlider(images: productData.images),
                  SizedBox(height: context.screenHeight * 0.01),
                  Row(
                    children: [
                      ProductText.mainProductText(
                        productData.title,
                        Colors.black,
                      ),
                      const Spacer(),
                      ProductText.productPriceText(
                        productData.price + "دينار",
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  ProductText.secProductText(
                    productData.vendor.name,
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  ProductText.productAddressText(
                    productData.vendor.address,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                  ProductPhoneButton(
                    phone: productData.vendor.phone,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                  ProductText.productDescriptionText(
                    productData.description,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                  ProductText.headerText("قطع متشابهة"),
                  // SimilarWidget(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
