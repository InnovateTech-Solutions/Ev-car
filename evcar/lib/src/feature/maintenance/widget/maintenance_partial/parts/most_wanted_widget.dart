import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/parts/most_wanted_container.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:flutter/material.dart';

class MostWantedWidget extends StatelessWidget {
  const MostWantedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<PartsModel> list = [
      PartsModel(
          title: 'كبيلات اسلاك كهرباي',
          type: "",
          image: 'assets/images/mainphoto.png',
          price: 'Jod 319',
          vendor: 'الماهر للصيانة',
          vendorAddress: "عمان - البيادر",
          phone: '0796584253'),
      PartsModel(
          title: 'كبيلات اسلاك كهرباي',
          type: "",
          image: 'assets/images/mainphoto.png',
          price: 'Jod 319',
          vendor: 'الماهر للصيانة',
          vendorAddress: "عمان - البيادر",
          phone: '0796584253'),
    ];
    return SizedBox(
      height: context.screenHeight * 0.55,
      child: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: context.screenHeight * 0.01,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return MostWantedContainer(
            partsModel: list[index],
          );
        },
      ),
    );
  }
}
