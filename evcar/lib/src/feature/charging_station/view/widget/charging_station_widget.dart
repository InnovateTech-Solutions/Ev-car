import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/charging_station/controller/charging_station_controller.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/charging_station/view/widget/charging_station_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingStationWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ChargingStationWidget({Key? key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChargingStationController());
    return FutureBuilder(
      future: controller.fetchData(),
      builder: (context, AsyncSnapshot<List<ChargingStationModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<ChargingStationModel> stations = snapshot.data!;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.separated(
              itemCount: stations.length + 1,
              separatorBuilder: (BuildContext context, int index) {
                RxBool isFav = false.obs;
                return ChargingStationCard(
                  model: stations[index],
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
