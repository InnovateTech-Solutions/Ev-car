import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/favorite/controller/favorite_controller.dart';
import 'package:evcar/src/feature/favorite/widget/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.012 * context.screenHeight),
      child: Obx(
        () => ListView.separated(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              child: FavoriteCard(
                model: controller.favoriteList[index],
                isFav: controller.favoriteList[index].isFav,
              ),
              onDismissed: (direction) {
                controller.favoriteList.removeAt(index);
                controller.favoriteList[index].isFav.value = false;
                controller.saveFavorites();
                print(controller.favoriteList);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 0.05 * context.screenHeight,
            );
          },
        ),
      ),
    );
  }
}
