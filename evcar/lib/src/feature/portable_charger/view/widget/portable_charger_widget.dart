import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/portable_charger/model/portable_charger.dart';
import 'package:evcar/src/feature/portable_charger/view/widget/portable_charger_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortableChargerWidget extends StatelessWidget {
  const PortableChargerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          RxBool seeMore = false.obs;
          RxBool isFav = false.obs;

          return PortableChargerCard(
            model: PortableChargerModel(
                name: 'اكسترا للشحن المتنقل',
                feature: ["اسعار منافسة", "الشحن في اي مكان بالمملكة "],
                image: "assets/images/chargeStation1.png",
                chargerType: [
                  "شاحن صيني",
                  "شاحن تسلا",
                  "شاحن تسلا",
                ],
                phone: "phone"),
            seeMore: seeMore,
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
