import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/vendor_dashboard/model/category_model.dart';
import 'package:flutter/material.dart';

class DashboardCategoryWidget extends StatelessWidget {
  const DashboardCategoryWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: categoryModel.onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: context.screenHeight * 0.03,
            left: context.screenWidth * 0.02,
            right: context.screenWidth * 0.02),
        width: context.screenWidth * 0.4,
        height: context.screenHeight * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppTheme.lightAppColors.buttoncolor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            categoryModel.widget,
            SizedBox(height: context.screenHeight * 0.015),
            Text(
              categoryModel.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.lightAppColors.mainTextcolor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo-Bold',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
