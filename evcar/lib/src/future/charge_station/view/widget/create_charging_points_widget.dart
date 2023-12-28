import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custem_card_station.dart';

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
              itemBuilder: (context, index) => CustemCardStation(
                seeMore: true.obs,
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
