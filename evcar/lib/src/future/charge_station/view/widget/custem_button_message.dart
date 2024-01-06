import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/url_lancher_controller.dart';
import '../../repository/charge_station_model/charge_model.dart';

class CustemButtonMessage extends StatelessWidget {
  CustemButtonMessage({
    super.key,
    required this.station,
  });
  final UrlLauncherController _whatsAppController =
      Get.put(UrlLauncherController());
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _whatsAppController.openWhatsAppChat(station.number);
      },
      child: const Image(
        image: AssetImage(
          'assets/images/iconmessage.png',
        ),
      ),
    );
  }
}
