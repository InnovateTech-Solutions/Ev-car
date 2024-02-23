import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/controller/product_controller.dart';
import 'package:evcar/src/feature/product/model/product_detail_model.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_image.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_phone_button.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/similar_widget.dart';
import 'package:evcar/src/feature/shop/view/shop_page.dart';
import 'package:evcar/src/feature/shop/widget/widget_collection.dart/shop_app_bar.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Container(
      child: FutureBuilder<ProductDetails>(
        future: controller.fetchProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.lightAppColors.bordercolor,
              ),
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
                    ShopAppBar(),
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
                          productData.price + " " + "دينار",
                        ),
                      ],
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    GestureDetector(
                      onTap: () {
                        Get.to(ShopPage(
                            shopModel: Vendor(
                                id: productData.vendor.id,
                                title: productData.vendor.title,
                                subtitle: productData.vendor.subtitle,
                                img: productData.vendor.img,
                                address: productData.vendor.address,
                                number: productData.vendor.number,
                                commercialLicense:
                                    productData.vendor.commercialLicense,
                                password: productData.vendor.password,
                                type: productData.vendor.type,
                                tags: productData.vendor.tags,
                                description: productData.vendor.description,
                                status: productData.vendor.status,
                                rating: productData.vendor.rating)));
                      },
                      child: ProductText.secProductText(
                        productData.vendor.title,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    ProductText.productAddressText(
                      productData.vendor.address,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    ProductPhoneButton(
                      phone: productData.vendor.number,
                      id: "",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    ProductText.productDescriptionText(
                      productData.description,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                    ProductText.headerText("قطع متشابهة"),
                    SimilarWidget(
                      typeId: productData.typeOfProduct.id,
                      numbre: productData.vendor.number,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
