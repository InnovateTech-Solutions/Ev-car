import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../controller/charge_station_controller.dart';
import 'custom_cart_station.dart';

class ChargeStationWidget extends StatelessWidget {
  ChargeStationWidget({super.key});
  final ChargeStationController stationController =
      Get.put(ChargeStationController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (index < stationController.stations.length) {
                    final station = stationController.stations[index];
                    return CustemCardStation(
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
        );
      }),
    );
  }
}
