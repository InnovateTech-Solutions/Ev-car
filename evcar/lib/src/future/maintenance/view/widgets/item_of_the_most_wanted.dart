import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';

class TheMostWanted extends StatelessWidget {
  const TheMostWanted({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromRGBO(221, 221, 219, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.textstyle16(
                  'كبيلات اسلاك كهرباي',
                  Colors.black,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/Staricon.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .03,
                    ),
                    Styles.textstyle12('4.5', Colors.grey),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .03,
                    ),
                    const Image(image: AssetImage('assets/images/Ellipse.png')),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .03,
                    ),
                    Styles.textstyle12(
                      'الماهر للصيانة',
                      const Color.fromRGBO(166, 167, 152, 1),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Styles.textstyle16(
                  'Jod 319',
                  const Color.fromRGBO(254, 87, 87, 1),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(244, 245, 247, 1),
                image: const DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage(
                    'assets/images/image14.png',
                  ),
                ),
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/heart_faver.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
