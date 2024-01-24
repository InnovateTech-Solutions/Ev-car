import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/url_lancher_controller.dart';
import '../../repository/charge_station_model/charge_model.dart';

class CustemButtonCall extends StatelessWidget {
  CustemButtonCall({
    super.key,
    required this.text,
    this.station,
  });

  final UrlLauncherController phoneController =
      Get.put(UrlLauncherController());
  final String text;
  final ChargeModel? station;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 30,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide.none,
      ),
      color: const Color.fromRGBO(0, 168, 168, 1),
      onPressed: () {
        phoneController.launchPhoneCall(station!.number);
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'cairo-Medium',
        ),
      ),
    );
  }
}
