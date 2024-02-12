import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/home_charging_station/model/charging_model.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/text/mobile_charger_text.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/widget_collection/mobile_button.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/widget_collection/seemore_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileChargerCard extends StatelessWidget {
  const MobileChargerCard(
      {super.key,
      required this.model,
      required this.seeMore,
      required this.widget});
  final RxBool seeMore;
  final Widget widget;
  final ChargingStation model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Obx(
        () => Container(
          margin: EdgeInsets.symmetric(
              horizontal: 0.022 * context.screenWidth,
              vertical: 0.01 * context.screenHeight),
          padding: EdgeInsets.only(
            top: 0.02 * context.screenHeight,
            right: 0.015 * context.screenWidth,
          ),
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
                    borderRadius:
                        BorderRadius.circular(0.02 * context.screenHeight),
                    image: DecorationImage(
                        image: NetworkImage(model.image), fit: BoxFit.cover)),
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
                  SizedBox(height: 0.01 * context.screenHeight),
                  SizedBox(
                    height: 0.05 * context.screenHeight,
                    width: 0.5 * context.screenWidth,
                    child: ListView.builder(
                        itemCount: model.features.length,
                        itemBuilder: (context, index) {
                          return MobileChargerText.thirdText(
                              "-${model.features[index]}");
                        }),
                  ),
                  SizedBox(height: 0.01 * context.screenHeight),
                  chargerTypeContainer(context, seeMore, model),
                  SizedBox(height: 0.01 * context.screenHeight),
                  MobileChargerButton(
                    phone: model.number,
                  )
                ],
              ),
              const Spacer(),
              widget
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
