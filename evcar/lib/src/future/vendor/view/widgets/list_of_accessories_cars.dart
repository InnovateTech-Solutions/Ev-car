import 'package:flutter/material.dart';

import 'item_of_accessories_of_cars.dart';

class ListOfAccessoriesOfCars extends StatelessWidget {
  const ListOfAccessoriesOfCars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemOfAccessoriseOfCars(),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * .06),
        itemCount: 2,
      ),
    );
  }
}
