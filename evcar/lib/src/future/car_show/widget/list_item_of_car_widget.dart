import 'package:flutter/material.dart';

import 'item_car_widget.dart';

class ListItemOfCarWidget extends StatelessWidget {
  const ListItemOfCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        itemBuilder: (context, index) => const ItemCarWidget(
          image: 'assets/images/Rectangle 2589.png',
          name: '2023 Lucid Air',
          text1: '-تسير 500 ك بالشحنة',
          price: 'Jod 89,50',
          text2: '-تعمل ببطارسة ايون',
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        itemCount: 3,
      ),
    );
  }
}
