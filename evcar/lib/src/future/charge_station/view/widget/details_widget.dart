import 'package:evcar/src/future/charge_station/view/widget/custem_button_call.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import 'custon_text_location.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/station.png',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Row(
            children: [
              Styles.textstyle22('توب لنقاط الشحن'),
              const Spacer(),
              const Image(
                image: AssetImage(
                  'assets/images/Staricon.png',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 55,
              ),
              Styles.rating('4.6'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          const CustomTextLocation(
            location: 'عمان-القويسمة',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Styles.textstyle(
              'تتوفر لدينا خدمات اضافية مثل غسيل السيارات وكافيه\nللجلوس والانتظار لحين انتهاء الشحن'),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          const Image(
            image: AssetImage('assets/images/typecharge.png'),
          ),
          Row(
            children: [
              CustemButtonCall(),
            ],
          )
        ],
      ),
    );
  }
}
