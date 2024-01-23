import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_appbar.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/product_phone_button.dart';
import 'package:evcar/src/feature/shop/model/shop_model.dart';
import 'package:evcar/src/feature/shop/widget/shop_product_widget.dart';
import 'package:evcar/src/feature/shop/widget/shop_type_widget.dart';
import 'package:flutter/material.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key, required this.shopModel});
  final ShopModel shopModel;
  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(shopModel.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Row(
            children: [
              ProductText.mainProductText(shopModel.name, Colors.black),
              const Spacer(),
              Icon(
                Icons.star,
                color: Color(0xffF2C94C),
              ),
              ProductText.mainProductText(
                  shopModel.rate, AppTheme.lightAppColors.subTextcolor),
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
            phone: shopModel.phone,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.productDescriptionText(shopModel.info),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ProductText.headerText("قطع متشابهة"),
          ShopProductWidge()
        ]),
      ),
    );
  }
}
