import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';

class ItemOfMaintenance extends StatelessWidget {
  const ItemOfMaintenance({
    super.key,
    this.h1 = .15,
    this.w1 = .4,
    this.r1 = 30,
    this.h2 = .07,
    this.w2 = .4,
    this.r2 = 30,
  });

  final double h1, h2;
  final double w1, w2;
  final double r1, r2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * h1,
            width: MediaQuery.of(context).size.width * w1,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/main.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(r1),
                  topRight: Radius.circular(r2),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * h2,
            width: MediaQuery.of(context).size.width * w2,
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
