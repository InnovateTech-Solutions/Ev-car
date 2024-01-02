import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';

class CustomTypeOfMaintenance extends StatelessWidget {
  const CustomTypeOfMaintenance(
      {super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(218, 218, 218, 1),
          )),
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
          ),
          Styles.textstyle12(text, Colors.black),
        ],
      ),
    );
  }
}
