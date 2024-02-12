import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/text/mobile_charger_text.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/widget_collection/mobile_button.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:evcar/src/feature/vendor_account/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shop/view/shop_page.dart';

class SearchVendorWidget extends StatelessWidget {
  const SearchVendorWidget({super.key, required this.vendor});
  final Vendor vendor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(ShopPage(
              shopModel: Vendor(
                  id: vendor.id,
                  title: vendor.title,
                  subtitle: vendor.subtitle,
                  img: vendor.img,
                  address: vendor.address,
                  number: vendor.number,
                  commercialLicense: vendor.commercialLicense,
                  password: vendor.password,
                  type: vendor.type,
                  tags: vendor.tags,
                  status: vendor.status,
                  description: vendor.description,
                  rating: vendor.rating)));
        },
        child: Container(
            padding: EdgeInsets.all(10),
            width: context.screenWidth,
            height: context.screenHeight * 0.15,
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.lightAppColors.bordercolor),
                borderRadius: BorderRadius.circular(20)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: context.screenWidth * 0.3,
                height: context.screenHeight * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(vendor.img), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: context.screenWidth * 0.051,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget.subVendorText(shortenText(
                    vendor.title,
                  )),
                  MobileChargerText.thirdText(
                    shortenText(vendor.description),
                  ),
                  Spacer(),
                  MobileChargerButton(
                    phone: vendor.number,
                  )
                ],
              ),
            ])));
  }

  String shortenText(String text, {int maxLength = 15}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
}
