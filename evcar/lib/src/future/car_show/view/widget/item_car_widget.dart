import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import 'custom_button_car_show_widget.dart';

class ItemCarWidget extends StatelessWidget {
  const ItemCarWidget(
      {super.key,
      required this.name,
      required this.text1,
      required this.text2,
      required this.image,
      required this.price});

  final String name;
  final String text1;
  final String text2;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .197,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .01,
          vertical: MediaQuery.of(context).size.height * .02,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(218, 218, 218, 1),
              spreadRadius: 3,
              blurRadius: 20,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image(
              image: NetworkImage(image),
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * .35,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.textstyle14bold(name, Colors.black),
                Styles.textstyle12(text1, Colors.black),
                Styles.textstyle12(text2, Colors.black),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .007,
                ),
                Styles.textstyle14(price, Colors.red),
                Row(
                  children: [
                    CustemButtonCarShowWidget(
                      text: 'تفاصيل',
                      colorText: const Color.fromRGBO(0, 168, 168, 1),
                      colorButton: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .007,
                    ),
                    CustemButtonCarShowWidget(
                      text: 'تواصل',
                      colorText: Colors.white,
                      colorButton: const Color.fromRGBO(0, 168, 168, 1),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {},
                  child: const Image(
                      image: AssetImage('assets/images/favriteicon.png'))),
            ),
          ],
        ),
      ),
    );
  }
}
