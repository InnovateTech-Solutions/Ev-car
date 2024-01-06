import 'package:flutter/material.dart';

import 'item_of_the_most_wanted.dart';

class ListViewOfTheMostWanted extends StatelessWidget {
  const ListViewOfTheMostWanted({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => const TheMostWanted(),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .02,
        ),
        itemCount: 2,
      ),
    );
  }
}
