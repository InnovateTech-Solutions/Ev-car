import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';
import '../../../../core/widgets/divider_vertical.dart';

class ItemOfCars extends StatelessWidget {
  const ItemOfCars({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .4,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/cars.png'),
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border: Border.all(color: Colors.white)),
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  child: InkWell(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage('assets/images/Vector.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                    child: Styles.textstyle12(
                        '1/5', const Color.fromRGBO(102, 102, 102, 1)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.textstyle17(
                  'فورد فوكس كهربائية',
                  const Color.fromRGBO(26, 26, 26, 1),
                ),
                Styles.textstyle12(
                  'شحن لمدة 6 ساعات',
                  const Color.fromRGBO(171, 171, 171, 1),
                ),
                Styles.textstyle14(
                  '450 كيلو بشحنة',
                  const Color.fromRGBO(171, 171, 171, 1),
                ),
                Row(
                  children: [
                    Styles.textstyle10(
                      'دفع خلفي',
                      const Color.fromRGBO(171, 171, 171, 1),
                    ),
                    const MyDividerVertical(),
                    Styles.textstyle10(
                      '450 حصان',
                      const Color.fromRGBO(171, 171, 171, 1),
                    ),
                    const MyDividerVertical(),
                    Styles.textstyle10(
                      '5 مقاعد',
                      const Color.fromRGBO(171, 171, 171, 1),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Styles.textstyle20(
                      '13,00 دينار', const Color.fromRGBO(227, 24, 55, 1)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
