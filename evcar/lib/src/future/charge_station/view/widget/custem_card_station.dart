import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widget/text_widget/text_widget.dart';
import 'custem_favrite_icon.dart';
import 'custem_icons.dart';

class CustemCardStation extends StatelessWidget {
  const CustemCardStation({super.key, required this.seeMore});
  final RxBool seeMore;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: Obx(
        () => Container(
          padding: EdgeInsets.only(
            top: screenHeight * 0.01,
            right: screenWidht * 0.02,
          ),
          margin: EdgeInsets.only(
            left: screenWidht * 0.07,
            right: screenWidht * 0.07,
          ),
          width: MediaQuery.of(context).size.width,
          height: seeMore.value == false
              ? 0.156 * screenHeight
              : 0.3 * screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage('assets/images/chargeStation1.png'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const CustemTextTitle(
                  //   title: 'اكسترا للشحن المتنقل',
                  // ),
                  Styles.textstyle17('اكسترا للشحن المتنقل'),
                  // const CustemTextDetails(
                  //   text: '-الشحن في اي مكان بالمملكة \n-اسعار منافسة',
                  // ),
                  Styles.details('-الشحن في اي مكان بالمملكة \n-اسعار منافسة'),
                  InkWell(
                    onTap: () {
                      if (seeMore.isTrue) {
                        seeMore.value = false;
                      } else {
                        seeMore.value = true;
                      }
                    },
                    child: Obx(
                      () => Text(
                        seeMore.value == false ? 'المزيد ...' : 'اقل ...',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontFamily: 'cairo-Medium',
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      child: seeMore.value == false
                          ? Container()
                          : Image.asset(
                              "assets/images/typecharge.png",
                              width: 0.4 * screenWidht,
                              height: 0.1 * screenHeight,
                            ),
                    ),
                  ),
                  const CustemIcons(),
                ],
              ),
              const Spacer(),
              const CustemFavriteIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
