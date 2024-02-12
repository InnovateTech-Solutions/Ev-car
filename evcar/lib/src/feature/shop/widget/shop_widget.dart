import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_appbar.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_phone_button.dart';
import 'package:evcar/src/feature/shop/controller/shop_controller.dart';
import 'package:evcar/src/feature/shop/widget/accessories_widget.dart';
import 'package:evcar/src/feature/shop/widget/shop_product_widget.dart';
import 'package:evcar/src/feature/shop/widget/shop_rating.dart';
import 'package:evcar/src/feature/shop/widget/shop_type_widget.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key, required this.shopModel});
  final Vendor shopModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopController());
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.02,
        horizontal: context.screenWidth * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductAppBar(),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Container(
            width: context.screenWidth,
            height: 0.25 * context.screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(shopModel.img), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Row(
            children: [
              ProductText.mainProductText(shopModel.title, Colors.black),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.dialog(RatingDialog(
                      image: shopModel.img,
                      name: shopModel.title,
                      description: shopModel.description));
                },
                child: Icon(
                  Icons.star,
                  color: Color(0xffF2C94C),
                ),
              ),
              ProductText.mainProductText(
                  shopModel.rating, AppTheme.lightAppColors.subTextcolor),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.secProductText(shopModel.description),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.01,
          ),
          ShopTypeWidget(
            title: shopModel.type,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          ProductText.productAddressText(shopModel.address),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          ProductPhoneButton(
            phone: shopModel.number,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.productDescriptionText(shopModel.subtitle),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.headerText("قطع غيار السيارات"),
          ShopProductWidget(
            vendorId: shopModel.id ?? '',
            phone: shopModel.number,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.headerText("إكسسوارات السيارات"),
          AccessoriesWidget(
            vendorId: shopModel.id,
            phone: shopModel.number,
          )
        ]),
      ),
    );
  }
}
