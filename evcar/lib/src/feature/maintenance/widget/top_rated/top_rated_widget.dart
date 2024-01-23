import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance/widget/top_rated/top_rated.dart';
import 'package:evcar/src/feature/shop/model/shop_model.dart';
import 'package:flutter/material.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.25,
      width: context.screenWidth,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return TopRated(
              shopModel: ShopModel(
                  name: "ابو جهاد",
                  image: "assets/images/station.png",
                  address: "عمان - البيادر",
                  description: "لصيانة السيارات الكهربائية",
                  phone: '0789456123',
                  type: 'مركز صيانة',
                  info:
                      'تصليح كافة انواع السيارت الكهربائية من فحص وتركيب البطاريات وغيره',
                  rate: '4.5'),
            );
          }),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: context.screenWidth * 0.03,
            );
          },
          itemCount: 5),
    );
  }
}
