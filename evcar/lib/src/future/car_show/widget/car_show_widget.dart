import 'package:flutter/material.dart';
import '../../maintenance/view/widgets/custom_information_widget.dart';
import '../../maintenance/view/widgets/search_widget.dart';
import '../../maintenance/view/widgets/title_bar.dart';
import '../../vendor/view/widgets/list_title_widget.dart';
import 'list_item_of_car_show_widget.dart';
import 'list_item_of_car_widget.dart';

class CarShowWidget extends StatelessWidget {
  const CarShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .04,
            vertical: MediaQuery.of(context).size.height * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const TitleBar(text: 'معارض سيارات'),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              const ListItemOfCarShowWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              const TitleBar(text: 'المركبات الاكثر شعبية'),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              ListTitleWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              const ListItemOfCarWidget()
            ],
          ),
        ),
      ),
    );
  }
}
