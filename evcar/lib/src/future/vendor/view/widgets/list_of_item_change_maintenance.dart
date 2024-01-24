import 'package:flutter/material.dart';
import 'item_change_maintenance.dart';

class ListOfItemChangeMaintenance extends StatelessWidget {
  const ListOfItemChangeMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemChangeMaintenance(),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * .06),
        itemCount: 2,
      ),
    );
  }
}
