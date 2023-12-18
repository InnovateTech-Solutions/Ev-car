import 'package:flutter/material.dart';
import 'custem_card_station.dart';

class ChargeStationWidget extends StatelessWidget {
  const ChargeStationWidget({super.key});

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
