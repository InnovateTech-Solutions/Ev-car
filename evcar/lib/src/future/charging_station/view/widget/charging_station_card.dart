import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/model/detail_model.dart';
import 'package:evcar/src/future/charging_station/view/page/detail_page.dart';
import 'package:evcar/src/future/portable_charger/view/widget/custem_favrite_icon.dart';
import 'package:evcar/src/future/portable_charger/view/widget/portable_button.dart';
import 'package:evcar/src/future/portable_charger/view/widget/portable_charger_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingStationCard extends StatelessWidget {
  const ChargingStationCard(
      {super.key, required this.model, required this.isFav});
  final RxBool isFav;

  final ChargingStationModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailPage(
          detailModel: ChargingStationModel(
              charger: [
                "شاحن صيني",
                "شاحن تسلا",
                "شاحن تسلا",
              ],
              description:
                  "تتوفر لدينا خدمات اضافية مثل غسيل السيارات وكافيه للجلوس والانتظار لحين انتهاء الشحن",
              image: "assets/images/station.png",
              location: "عمان - القويسمة",
              name: "توب لنقاط الشحن",
              phone: "07788994456",
              rate: " 4.6",
              coordinate: '37.4219991,-122.0840011',
              feature: []),
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          right: 10,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 0.17 * context.screenHeight,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 0.25 * context.screenWidth,
              height: 0.15 * context.screenHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(model.image), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 0.03 * context.screenWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PortableChargerText.mainText(
                  model.name,
                ),
                SizedBox(height: 0.01 * context.screenHeight),
                SizedBox(
                  height: 0.05 * context.screenHeight,
                  width: 0.5 * context.screenWidth,
                  child: ListView.builder(
                      itemCount: model.feature.length,
                      itemBuilder: (context, index) {
                        return PortableChargerText.thirdText(
                            "-${model.feature[index]}");
                      }),
                ),
                SizedBox(height: 0.01 * context.screenHeight),
                const PortableChargerButton(
                  phone: '',
                )
              ],
            ),
            const Spacer(),
            isFavWidget(isFav, context),
          ],
        ),
      ),
    );
  }
}
