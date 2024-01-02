import 'package:flutter/material.dart';

import 'custom_item.dart';

class ListViewOfCustomItem extends StatelessWidget {
  const ListViewOfCustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CustomItem(),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * .03),
        itemCount: 2,
      ),
    );
  }
}
