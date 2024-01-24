import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';
import 'custom_cell_button_vender.dart';

class ItemChangeMaintenance extends StatelessWidget {
  const ItemChangeMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width * .4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainphoto.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Iconsax.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Styles.textstyle10(
                  '1/5',
                  const Color.fromRGBO(77, 77, 77, 1),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          width: MediaQuery.of(context).size.width * .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.textstyle12('اضوية خلفية', Colors.black),
              SizedBox(
                height: MediaQuery.of(context).size.height * .005,
              ),
              Styles.textstyle10(
                'تويوتا كامري 2006',
                const Color.fromRGBO(77, 77, 77, 1),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .005,
              ),
              Row(
                children: [
                  Styles.textstyle16(
                    '13,00 دينار',
                    Colors.red,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  const Image(
                    image:
                        AssetImage('assets/images/star.leadinghalf.filled.png'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .009,
                  ),
                  Styles.textstyle(
                    '3.5',
                    const Color.fromRGBO(171, 171, 171, 1),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .005,
              ),
              const CustomCallBottunVendor(
                text: 'اطلب الان',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
