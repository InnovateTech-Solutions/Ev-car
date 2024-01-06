import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/controller/c/arging_station_controller.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_button.dart';
import 'package:evcar/src/feature/charging_station/view/widget/detail_page_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.detailModel});
  final ChargingStationModel detailModel;
  @override
  Widget build(BuildContext context) {
    final detailController = Get.put(ChargingStationController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 0.27 * screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    detailModel.image,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 0.04 * screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailText.mainText(detailModel.name),
              DetailText.ratingText(
                detailModel.rate,
              ),
            ],
          ),
          SizedBox(
            height: 0.01 * screenHeight,
          ),
          DetailText.locationText(detailModel.location),
          SizedBox(
            height: 0.01 * screenHeight,
          ),
          DetailText.descriptionText(detailModel.description),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Container(
            height: 0.09 * screenHeight,
            width: 0.65 * screenWidth,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.2))),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: detailModel.charger.length + 1,
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                        "assets/images/${detailModel.charger[index]}.png"),
                    DetailText.chargeText(detailModel.charger[index])
                  ],
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(width: 0.07 * screenWidth);
              },
            ),
          ),
          SizedBox(
            height: 0.02 * screenHeight,
          ),
          Row(
            children: [
              const CustemButtonCall(title: 'اتصل الان'),
              SizedBox(
                width: 0.02 * screenWidth,
              ),
              GestureDetector(
                onTap: () =>
                    detailController.openGoogleMap(detailModel.coordinate),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  width: 0.12 * screenWidth,
                  height: 0.05 * screenHeight,
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
