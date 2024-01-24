import 'package:evcar/src/future/maintenance/view/widgets/search_widget.dart';
import 'package:evcar/src/future/maintenance/view/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'all_item_maintenance.dart';
import 'custom_information_widget.dart';
import 'list_view_of_the_most_wanted.dart';
import 'list_view_of_the_top_rating.dart';

class HomeMaintenanceWidget extends StatelessWidget {
  const HomeMaintenanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .04,
        vertical: MediaQuery.of(context).size.height * .04,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomInformationWidget(
              title: 'صباح الخير ,',
              text: 'مسلم العبسي',
              pic: 'assets/images/profile.png',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            const SearchWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            const TitleBar(text: 'خدماتنا'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            const AllItemMaintenance(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            const TitleBar(text: 'الاعلى تقييما'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const ListViewOfTheTopRating(),
            const TitleBar(text: 'الأكثر طلبا'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const ListViewOfTheMostWanted(),
          ],
        ),
      ),
    ));
  }
}
