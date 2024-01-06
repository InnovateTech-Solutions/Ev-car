import 'package:flutter/material.dart';

import '../../repository/charge_station_model/charge_model.dart';
import 'custem_button_call.dart';
import 'custem_button_message.dart';

class CustemIcons extends StatelessWidget {
  const CustemIcons({
    super.key,
    required this.station,
  });
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustemButtonCall(
          text: 'اتصل الان',
          station: station,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 50,
        ),
        CustemButtonMessage(
          station: station,
        ),
      ],
    );
  }
}
