import 'package:flutter/material.dart';

import 'item_of_cars.dart';

class ListItemOfCars extends StatelessWidget {
  const ListItemOfCars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemOfCars(),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .04,
        ),
        itemCount: 3,
      ),
    );
  }
}
