import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/portable_charger/controller/portable_charger_controller.dart';
import 'package:evcar/src/feature/portable_charger/view/widget/portable_charger_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortableChargerWidget extends StatelessWidget {
  const PortableChargerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortableChargerController());

    return FutureBuilder(
      future: controller.fetchData(),
      builder: (context, AsyncSnapshot<List<ChargingStationModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<ChargingStationModel> stations = snapshot.data!;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.separated(
              itemCount: stations.length + 1,
              separatorBuilder: (BuildContext context, int index) {
                RxBool seeMore = false.obs;
                RxBool isFav = false.obs;

                return PortableChargerCard(
                  model: stations[index],
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
      },
    );
  }
}
