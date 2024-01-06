import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/model/detail_model.dart';
import 'package:evcar/src/future/portable_charger/view/widget/custem_favrite_icon.dart';
import 'package:evcar/src/future/portable_charger/view/widget/portable_button.dart';
import 'package:evcar/src/future/portable_charger/view/widget/portable_charger_text.dart';
import 'package:evcar/src/future/portable_charger/view/widget/seemore_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortableChargerCard extends StatelessWidget {
  const PortableChargerCard(
      {super.key,
      required this.model,
      required this.seeMore,
      required this.isFav});
  final RxBool seeMore;
  final RxBool isFav;

  final ChargingStationModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Obx(
        () => Container(
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: seeMore.value == false
              ? 0.2 * context.screenHeight
              : 0.35 * context.screenHeight,
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
                  PortableChargerText.mainText(shortenText(
                    model.title,
                  )),
                  SizedBox(height: 0.01 * context.screenHeight),
                  SizedBox(
                    height: 0.05 * context.screenHeight,
                    width: 0.5 * context.screenWidth,
                    child: ListView.builder(
                        itemCount: model.features.length,
                        itemBuilder: (context, index) {
                          return PortableChargerText.thirdText(
                              "-${model.features[index]}");
                        }),
                  ),
                  SizedBox(height: 0.01 * context.screenHeight),
                  chargerTypeContainer(context, seeMore, model),
                  SizedBox(height: 0.01 * context.screenHeight),
                  const PortableChargerButton(
                    phone: '+962790973474',
                  )
                ],
              ),
              const Spacer(),
              isFavWidget(isFav, context),
            ],
          ),
        ),
      ),
    );
  }
}

String shortenText(String text, {int maxLength = 20}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}