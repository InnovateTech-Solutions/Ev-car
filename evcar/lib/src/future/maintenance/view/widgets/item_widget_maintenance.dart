import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';

class ItemWidgetMaintenance extends StatelessWidget {
  const ItemWidgetMaintenance(
      {super.key, required this.text, required this.image, this.onTap});

  final String text;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 35,
            backgroundColor: const Color.fromRGBO(215, 255, 255, 1),
            child: Image(
              image: AssetImage(image),
            ),
          ),
          Styles.textstyle12(text, Colors.black),
        ],
      ),
    );
  }
}
