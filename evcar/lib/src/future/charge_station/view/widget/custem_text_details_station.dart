import 'package:evcar/src/future/charge_station/controller/charge_station_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustemTextDetails extends StatelessWidget {
  const CustemTextDetails({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChargeStationController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'cairo-Medium',
          ),
        ),
      ],
    );
  }
}
