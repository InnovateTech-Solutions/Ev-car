import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';

class ItemOfTheTopRating extends StatelessWidget {
  const ItemOfTheTopRating({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width * .4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.textstyle16('ابو جهاد', Colors.black),
                Styles.textstyle10(
                  'لصيانة السيارات الكهربائية',
                  const Color.fromRGBO(68, 68, 68, 1),
                ),
                Row(
                  children: [
                    Styles.location('عمان - البيادر'),
                    const Spacer(),
                    Image.asset(
                      'assets/images/Staricon.png',
                      width: 14,
                      height: 14,
                    ),
                    Styles.textstyle12(
                      '4.6',
                      Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
