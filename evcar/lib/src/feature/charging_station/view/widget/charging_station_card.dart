import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/portable_charger/view/widget/custem_favrite_icon.dart';
import 'package:evcar/src/feature/portable_charger/view/widget/portable_button.dart';
import 'package:evcar/src/feature/portable_charger/view/widget/portable_charger_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingStationCard extends StatelessWidget {
  const ChargingStationCard(
      {super.key, required this.model, required this.isFav});
  final RxBool isFav;
  final ChargingStation model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.02 * context.screenHeight,
        right: 0.015 * context.screenWidth,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 0.25 * context.screenWidth,
            height: 0.15 * context.screenHeight,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(0.015 * context.screenHeight),
                image: DecorationImage(
                    image: NetworkImage(model.image), fit: BoxFit.cover)),
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
              PortableChargerButton(
                phone: model.number,
              )
            ],
          ),
          const Spacer(),
          isFavWidget(
              false,
              context,
              ChargingStation(
                id: model.id,
                title: model.title,
                image: model.image,
                address: model.address,
                coordinates: model.coordinates,
                number: model.number,
                features: model.features,
                type: model.type,
                chargers: model.chargers,
              )),
        ],
      ),
    );
  }
}

String shortenText(String text, {int maxLength = 10}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}