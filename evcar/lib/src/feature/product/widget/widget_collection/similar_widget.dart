import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/similar_container.dart';
import 'package:flutter/material.dart';

class SimilarWidget extends StatelessWidget {
  const SimilarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<PartsModel> list = [
      PartsModel(
          title: 'اضوية خلفية',
          type: "type",
          phone: "0777777777",
          image: "image",
          price: '13,00 دينار',
          vendor: "description",
          vendorAddress: "Amman"),
      PartsModel(
          title: 'اضوية خلفية',
          type: "type",
          phone: "0777777777",
          image: "image",
          price: '13,00 دينار',
          vendor: "description",
          vendorAddress: "Amman"),
      PartsModel(
          title: 'اضوية خلفية',
          type: "type",
          phone: "0777777777",
          image: "image",
          price: '13,00 دينار',
          vendor: "description",
          vendorAddress: "Amman"),
    ];
    return SizedBox(
      height: context.screenHeight * 0.33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        // separatorBuilder: (BuildContext context, int index) {
        //   return SizedBox(
        //     width: context.screenWidth * 0.05,
        //   );
        // },
        itemBuilder: (BuildContext context, int index) {
          return Center(child: SimilarContainer(product: list[index]));
        },
      ),
    );
  }
}