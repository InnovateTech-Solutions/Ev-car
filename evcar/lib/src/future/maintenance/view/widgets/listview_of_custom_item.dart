import 'package:flutter/material.dart';
import '../../../charge_station/repository/charge_station_model/charge_model.dart';
import 'custom_item.dart';

class ListViewOfCustomItem extends StatelessWidget {
  const ListViewOfCustomItem({super.key, required this.station});
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomItem(
          station: station,
        ),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * .03),
        itemCount: 2,
      ),
    );
  }
}
