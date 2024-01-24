import 'package:evcar/src/future/vendor/controller/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../maintenance/view/widgets/custom_information_widget.dart';
import '../../../maintenance/view/widgets/title_bar.dart';
import 'list_item_of_cars.dart';
import 'list_item_of_charge_centers.dart';
import 'list_item_of_maintenance.dart';
import 'list_of_accessories_cars.dart';
import 'list_of_item_change_maintenance.dart';
import 'list_title_widget.dart';
import 'list_title_with_image_of_item.dart';
import 'onboarding_vendor_widget.dart';

class HomeVendorWidget extends StatelessWidget {
  HomeVendorWidget({super.key});

  final VendorController controller = Get.put(VendorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .04,
          vertical: MediaQuery.of(context).size.height * .02,
        ),
        child: SingleChildScrollView(
          child: GetBuilder<VendorController>(
            init: VendorController(),
            builder: (controller) {
              return Column(
                children: [
                  const CustomInformationWidget(
                    title: 'مركز صيانة',
                    text: 'الوحدة للصيانة',
                    pic: 'assets/images/vendorProfile.png',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  OnBoardingVendorWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ListTitleWithImageOfItem(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TitleBar(
                    text: 'المركبات',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListTitleWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const ListItemOfCars(),
                  TitleBar(
                    text: 'مراكز الصيانة',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const ListItemOfMaintenance(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TitleBar(
                    text: 'مراكز الشحن',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListTitleWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const ListItemOfChargeCenters(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TitleBar(
                    text: 'قطع غيار السيارات',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListTitleWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const ListOfItemChangeMaintenance(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TitleBar(
                    text: 'اكسسوارات السيارات',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListTitleWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const ListOfAccessoriesOfCars(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
