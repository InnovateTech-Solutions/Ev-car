import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../controller/charge_station_controller.dart';
import 'custem_card_point_station.dart';

class CreateChargingPointsWidget extends StatelessWidget {
  CreateChargingPointsWidget({
    super.key,
  });
  final ChargeStationController stationController =
      Get.put(ChargeStationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  RxBool seeMore = false.obs;
                  if (index < stationController.stations.length) {
                    final station = stationController.stations[index];
                    return CustemCardPointStation(
                      seeMore: seeMore,
                      station: station,
                    );
                  } else {
                    return Center(
                      child: Styles.textstyle17(
                        'لايوجد محطات شحن',
                        Colors.black,
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
                itemCount: stationController.stations.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
