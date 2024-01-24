import 'package:evcar/src/future/maintenance/view/widgets/custom_location.dart';
import 'package:evcar/src/future/maintenance/view/widgets/head_of_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/text_widget/text_widget.dart';
import '../../../../core/widgets/custom_detials_of_place.dart';
import '../../../charge_station/repository/charge_station_model/charge_model.dart';
import '../../../charge_station/view/widget/custem_icons.dart';
import 'custom_item.dart';

import 'custom_type_maintenance.dart';
import 'listview_of_custom_item.dart';

class MaintenanceWidget extends StatelessWidget {
  const MaintenanceWidget({super.key, required this.station});
  final ChargeModel station;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.09,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadOfScreen(image: 'assets/images/main.png'),
            const CustomDetailsOfPlace(
              text: 'ابو جهاد',
              rating: '4.6',
            ),
            Styles.textstyle14(
              'لصيانة السيارات الكهربائية',
              const Color.fromRGBO(188, 189, 177, 1),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const CustomTypeOfMaintenance(
              text: 'مركز صيانة',
              image: 'assets/images/buildingicon.png',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const CustomLocation(text: 'عمان - االبيادر'),
            CustemIcons(
              station: station,
            ),
            Styles.textstyle16(
              'تصليح كلفة انواع السيارات الكهربائية من فحص وتركيب البطارات وغيره',
              const Color.fromRGBO(68, 68, 68, 1),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Styles.textstyle16(
              'قطع غيار السيارات',
              Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const ListViewOfCustomItem(),
            Styles.textstyle16(
              'إكسسوارات السيارات',
              Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CustomItem(),
                separatorBuilder: (context, index) =>
                    SizedBox(width: MediaQuery.of(context).size.width * .03),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
