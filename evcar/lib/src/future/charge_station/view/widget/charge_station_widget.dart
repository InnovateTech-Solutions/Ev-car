import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custem_card_station.dart';

class ChargeStationWidget extends StatelessWidget {
  const ChargeStationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemBuilder: (context, index) {
                RxBool seeMore = false.obs;
                return CustemCardStation(
                  seeMore: seeMore,
                );
              },
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
