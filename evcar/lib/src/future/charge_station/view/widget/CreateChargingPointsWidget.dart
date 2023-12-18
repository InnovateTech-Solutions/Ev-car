import 'package:evcar/src/future/charge_station/view/widget/custem_card_station.dart';
import 'package:flutter/material.dart';

class CreateChargingPointsWidget extends StatelessWidget {
  const CreateChargingPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemBuilder: (context, index) => const CustemCardStation(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 30,
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
