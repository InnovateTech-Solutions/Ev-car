import 'package:flutter/material.dart';
import 'custom_item_of_car_show_widget.dart';

class ListItemOfCarShowWidget extends StatelessWidget {
  const ListItemOfCarShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .07,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CustomItemOfCarShowWidget(
            image: 'assets/images/Rectangle 2594.png'),
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * .02,
        ),
        itemCount: 3,
      ),
    );
  }
}
