import 'package:flutter/material.dart';

import 'item_of_the_top_rating.dart';

class ListViewOfTheTopRating extends StatelessWidget {
  const ListViewOfTheTopRating({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ItemOfTheTopRating(),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .03,
        ),
        itemCount: 10,
      ),
    );
  }
}
