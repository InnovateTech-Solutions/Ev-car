import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../../charge_station/repository/charge_station_model/charge_model.dart';
import '../../../charge_station/view/widget/custem_icons.dart';
import 'appbar_maintenance.dart';
import 'custom_location.dart';
import 'head_of_screen.dart';
import 'listview_of_custom_item.dart';

class DetailsMaintenanceWidget extends StatelessWidget {
  const DetailsMaintenanceWidget({super.key, required this.station});
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMaintenance(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadOfScreen(
                image: 'assets/images/mainphoto.png',
              ),
              Row(
                children: [
                  Styles.textstyle22('اضوية خلفية', Colors.black),
                  const Spacer(),
                  Styles.textstyle28('13,00 دينار', Colors.red),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromRGBO(242, 201, 76, 1),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  Styles.rating('3.5'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  const Image(image: AssetImage('assets/images/Ellipse.png')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  Styles.textstyle17(
                    'الماهر للصيانة',
                    const Color.fromRGBO(166, 167, 152, 1),
                  )
                ],
              ),
              const CustomLocation(text: 'عمان - االبيادر'),
              CustemIcons(
                station: station,
              ),
              Styles.textstyle16(
                'توصيل مجاني وتركيب في اي مكان',
                const Color.fromRGBO(68, 68, 68, 1),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Styles.textstyle16(
                'قطع مشابهة',
                const Color.fromRGBO(26, 26, 26, 1),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              const ListViewOfCustomItem(),
            ],
          ),
        ),
      ),
    );
  }
}
