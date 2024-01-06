import 'package:evcar/src/future/charge_station/repository/charge_station_model/charge_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import 'custem_favrite_icon.dart';
import 'custem_icons.dart';

class CustemCardStation extends StatelessWidget {
  const CustemCardStation({super.key, required this.station});
  final ChargeModel station;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        left: screenWidht * 0.07,
        right: screenWidht * 0.07,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: screenWidht * 0.03,
          top: screenHeight * 0.01,
          bottom: screenHeight * 0.015,
          left: screenWidht * 0.007,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage('assets/images/chargeStation1.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Styles.textstyle17(station.title, Colors.black),
                Column(
                  children: station.features.map((e) {
                    return Styles.details(e);
                  }).toList(),
                ),
                CustemIcons(
                  station: station,
                ),
              ],
            ),
            const Spacer(),
            const CustemFavriteIcon(),
          ],
        ),
      ),
    );
  }
}
