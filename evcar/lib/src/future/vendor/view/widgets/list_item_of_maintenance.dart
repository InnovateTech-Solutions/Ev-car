import 'package:flutter/material.dart';
import 'item_of_maintenance.dart';

class ListItemOfMaintenance extends StatelessWidget {
  const ListItemOfMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemOfMaintenance(
          r1: 10,
          r2: 10,
          w1: .5,
          w2: .5,
          h1: .2,
          h2: .1,
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .03,
        ),
        itemCount: 10,
      ),
    );
  }
}
