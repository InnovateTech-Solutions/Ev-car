import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/parts/most_wanted_container.dart';
import 'package:evcar/src/feature/product/controller/product_controller.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductWidget extends StatelessWidget {
  const AllProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Container(
      color: AppTheme.lightAppColors.background,
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: controller.fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Product> list = snapshot.data!;

                    return SizedBox(
                      height: context.screenHeight * 0.15 * list.length,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: context.screenHeight * 0.01,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child:
                                  MostWantedContainer(partsModel: list[index]));
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
