import 'package:flutter/material.dart';

import 'item_of_charge_center.dart';

class ListItemOfChargeCenters extends StatelessWidget {
  const ListItemOfChargeCenters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemOfChargeCenter(),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        itemCount: 2,
      ),
    );
  }
}
