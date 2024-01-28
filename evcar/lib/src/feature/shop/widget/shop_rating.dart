import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_from_widget.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:evcar/src/feature/register/model/form_model.dart';
import 'package:evcar/src/feature/shop/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog(
      {super.key,
      required this.image,
      required this.name,
      required this.description});
  final String image;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopController());

    final _rating = 0.0.obs;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: Container(
        height: context.screenHeight * 0.45,
        width: context.screenWidth,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaintenanceText.shopMainText('تقييم'),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: context.screenHeight * 0.1,
                  height: context.screenHeight * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: context.screenWidth * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaintenanceText.shopMainText(name),
                    MaintenanceText.shopSecText(description),
                  ],
                )
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Obx(
              () => RatingBar.builder(
                unratedColor: AppTheme.lightAppColors.bordercolor,
                initialRating: _rating.value,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating.value = rating;
                },
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            AdsFormWidget(
              formModel: FormModel(
                controller: controller.ratingDescription,
                enableText: false,
                hintText: "الملاحظات",
                invisible: false,
                validator: null,
                type: TextInputType.text,
                inputFormat: null,
                onTap: () {},
              ),
              name: "title",
            ),
            Spacer(),
            SizedBox(
              height: context.screenHeight * 0.05,
              width: context.screenWidth * 0.5,
              child: IntroPageButton(
                colorButton: AppTheme.lightAppColors.buttoncolor,
                text: 'نشر التقييم',
                onPressed: () {},
                colorText: AppTheme.lightAppColors.mainTextcolor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
