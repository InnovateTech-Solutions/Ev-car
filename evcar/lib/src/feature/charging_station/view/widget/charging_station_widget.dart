import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
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
      builder: (context, AsyncSnapshot<List<ChargingStation>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: AppTheme.lightAppColors.bordercolor,
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<ChargingStation> stations = snapshot.data!;
          return Container(
            margin:
                EdgeInsets.symmetric(horizontal: 0.012 * context.screenHeight),
            child: ListView.separated(
              itemCount: stations.length + 1,
              separatorBuilder: (BuildContext context, int index) {
                return ChargingStationCard(
                  model: stations[index],
                  isFav: false.obs,
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
