import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import 'custom_cell_button_vender.dart';

class ItemOfChargeCenter extends StatelessWidget {
  const ItemOfChargeCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .16,
            width: MediaQuery.of(context).size.width * .4,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/station.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)),
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(227, 227, 227, 1),
                      child: Image(
                        image: AssetImage('assets/images/Vector.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .005,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .16,
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
                  'اكسترا للشحن المتنقل',
                  const Color.fromRGBO(26, 26, 26, 1),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Styles.textstyle12(
                  'اشحن في اي مكان بالمملكة',
                  const Color.fromRGBO(171, 171, 171, 1),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Styles.textstyle14(
                  'نوع الشحن',
                  const Color.fromRGBO(171, 171, 171, 1),
                ),
                const Spacer(),
                const CustomCallBottunVendor(text: 'اتصل الان'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
