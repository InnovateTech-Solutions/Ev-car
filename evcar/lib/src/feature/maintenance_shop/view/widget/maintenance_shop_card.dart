import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/text/mobile_charger_text.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/widget_collection/mobile_button.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/shop/view/shop_page.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceShopCard extends StatelessWidget {
  const MaintenanceShopCard({
    super.key,
    required this.model,
  });
  final Vendor model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ShopPage(
          shopModel: model,
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 0.022 * context.screenWidth,
            vertical: 0.012 * context.screenHeight),
        padding: EdgeInsets.only(
            top: 0.02 * context.screenHeight,
            bottom: 0.02 * context.screenHeight,
            right: 0.015 * context.screenWidth,
            left: 0.01 * context.screenWidth),
        height: 0.18 * context.screenHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppTheme.lightAppColors.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 0.25 * context.screenWidth,
              height: 0.15 * context.screenHeight,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(0.015 * context.screenHeight),
                  image: DecorationImage(
                      image: NetworkImage(model.img), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 0.03 * context.screenWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MobileChargerText.mainText(shortenText(
                  model.title,
                )),
                MobileChargerText.thirdText(
                    discriptionhortenText(model.subtitle)),
                SizedBox(height: 0.01 * context.screenHeight),
                Spacer(),
                MobileChargerButton(
                  phone: model.number,
                )
              ],
            ),
            model.rating != ""
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ProductText.mainProductText(
                          ratingshortenText(model.rating),
                          AppTheme.lightAppColors.subTextcolor),
                      Icon(
                        Icons.star,
                        color: Color(0xffF2C94C),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffF2C94C),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

String discriptionhortenText(String text, {int maxLength = 20}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}

String ratingshortenText(String text, {int maxLength = 3}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}';
  }
}

String shortenText(String text, {int maxLength = 15}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
