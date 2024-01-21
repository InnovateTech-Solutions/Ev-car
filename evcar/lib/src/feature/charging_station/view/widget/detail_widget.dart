import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_button.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_page_text.dart';
import 'package:evcar/src/feature/home_charging_station/controller/charging_station_controller.dart';
import 'package:evcar/src/feature/home_charging_station/model/charging_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.detailModel});
  final ChargingStation detailModel;
  @override
  Widget build(BuildContext context) {
    final detailController = Get.put(ChargingStationController());
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 0.04 * context.screenHeight,
          horizontal: 0.04 * context.screenWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 0.2 * context.screenHeight,
            width: context.screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    detailModel.image,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 0.04 * context.screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailText.mainText(detailModel.title),
              // DetailText.ratingText(
              //   detailModel.rate,
              // ),
            ],
          ),
          SizedBox(
            height: 0.01 * context.screenHeight,
          ),
          DetailText.locationText(detailModel.address),
          SizedBox(
            height: 0.01 * context.screenHeight,
          ),
          SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return DetailText.descriptionText(
                        detailModel.features[index]);
                  })),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          DetailText.secText("أنواع الشواحن"),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Container(
            height: 0.09 * context.screenHeight,
            width: 0.65 * context.screenWidth,
            padding: EdgeInsets.only(top: 0.015 * context.screenHeight),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.2))),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: detailModel.chargers!.length + 1,
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Image.network(detailModel.chargers![index].image),
                    DetailText.chargeText(detailModel.chargers![index].title)
                  ],
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(width: 0.07 * context.screenWidth);
              },
            ),
          ),
          SizedBox(
            height: 0.02 * context.screenHeight,
          ),
          Row(
            children: [
              CustemButtonCall(
                title: 'اتصل الان',
                phone: detailModel.number,
              ),
              SizedBox(
                width: 0.02 * context.screenWidth,
              ),
              GestureDetector(
                onTap: () =>
                    detailController.openGoogleMap(detailModel.coordinates),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  width: 0.12 * context.screenWidth,
                  height: 0.05 * context.screenHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppTheme.lightAppColors.buttoncolor)),
                  child: SvgPicture.asset("assets/images/locationIcon.svg"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
