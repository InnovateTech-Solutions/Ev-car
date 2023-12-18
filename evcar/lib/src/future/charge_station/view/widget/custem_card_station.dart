import 'package:flutter/material.dart';
import 'custem_favrite_icon.dart';
import 'custem_icons.dart';
import 'custem_text_details_station.dart';
import 'custem_text_title.dart';

class CustemCardStation extends StatelessWidget {
  const CustemCardStation({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          right: 10,
        ),
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
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
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
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
              width: MediaQuery.of(context).size.width / 30,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustemTextTitle(
                  title: 'اكسترا للشحن المتنقل',
                ),
                CustemTextDetails(
                  text: '-الشحن في اي مكان بالمملكة \n-اسعار منافسة',
                ),
                CustemIcons(),
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
