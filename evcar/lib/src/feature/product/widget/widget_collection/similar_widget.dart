import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/product/controller/product_controller.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/similar_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimilarWidget extends StatelessWidget {
  const SimilarWidget({super.key, required this.typeId, required this.numbre});
  final String typeId;
  final String numbre;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return FutureBuilder(
      future: controller.fetchProductByType(typeId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final products = snapshot.data!;
          return SizedBox(
            height: context.screenHeight * 0.33,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: SimilarContainer(
                  product: products[index],
                  phone: numbre,
                ));
              },
            ),
          );
        }
      },
    );
  }
}
