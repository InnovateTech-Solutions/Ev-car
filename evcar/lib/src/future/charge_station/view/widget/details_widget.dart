import 'package:evcar/src/future/charge_station/view/widget/custem_button_call.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../repository/charge_station_model/charge_model.dart';
import 'custon_text_location.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.station});
  final ChargeModel station;

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
                    'assets/images/chargeStation1.png',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Row(
            children: [
              Styles.textstyle22(station.title),
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
          CustomTextLocation(
            location: station.address,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Column(
            children: station.features.map((e) {
              return Styles.textstyle(e, Colors.black);
            }).toList(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Row(
            children: [
              CustemButtonCall(
                text: 'اتصل الان',
                station: station,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
