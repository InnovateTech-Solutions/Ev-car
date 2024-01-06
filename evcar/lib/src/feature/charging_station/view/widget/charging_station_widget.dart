import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/charging_station/view/widget/charging_station_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingStationWidget extends StatelessWidget {
  const ChargingStationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          RxBool isFav = false.obs;

          return ChargingStationCard(
            model: ChargingStationModel(
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
              feature: ["اسعار منافسة", "الشحن في اي مكان بالمملكة "],
            ),
            isFav: isFav,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 0.04 * context.screenHeight,
          );
        },
      ),
    );
  }
}
