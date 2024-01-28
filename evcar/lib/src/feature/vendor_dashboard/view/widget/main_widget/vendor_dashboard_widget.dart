import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/vendor_dashboard/model/category_model.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/widget/widget_collection/dashboard_category.dart';
import 'package:evcar/src/feature/vendor_dashboard/view/widget/widget_collection/vendor_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VendorDashboardWidget extends StatelessWidget {
  const VendorDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> list = [
      CategoryModel(
          widget: Image.asset("assets/vendor/services.png"),
          title: "الخدمات ",
          onTap: () {}),
      CategoryModel(
          widget: SvgPicture.asset("assets/vendor/info.svg"),
          title: "المعلومات\nالأساسية",
          onTap: () {}),
      CategoryModel(
          widget: SvgPicture.asset("assets/vendor/offers.svg"),
          title: "العروض",
          onTap: () {}),
      CategoryModel(
          widget: SvgPicture.asset("assets/vendor/product.svg"),
          title: "قطع الغيار والاكسسورات",
          onTap: () {}),
    ];
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.05,
          horizontal: context.screenWidth * 0.05),
      child: Column(
        children: [
          VendorAppBar(),
          SizedBox(
            height: context.screenHeight * 0.1,
          ),
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight * 0.5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return DashboardCategoryWidget(
                  categoryModel: list[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
